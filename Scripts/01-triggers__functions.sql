CREATE OR REPLACE FUNCTION get_contracts_by_date_range(start_date DATE, end_date DATE)
RETURNS TABLE(contract_id INTEGER, property_id INTEGER, tenant_oib TEXT, check_in DATE, check_out DATE) AS $$
BEGIN
    RETURN QUERY SELECT rental_contract.contract_id, rental_contract.property_id, rental_contract.tenant_oib, rental_contract.check_in, rental_contract.check_out FROM rental_contract WHERE rental_contract.check_in >= start_date AND rental_contract.check_out <= end_date;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION calculate_rental_days(contract_id INTEGER)
RETURNS INTEGER AS $$
DECLARE
    check_in_date DATE;
    check_out_date DATE;
BEGIN
    SELECT check_in, check_out INTO check_in_date, check_out_date FROM rental_contract WHERE rental_contract.contract_id = rental_contract.contract_id;
    RETURN (check_out_date - check_in_date);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION calculate_utility_due_amount(contract_id INTEGER, due_date TIMESTAMP)
RETURNS NUMERIC AS $$
DECLARE
  utility_due_amount NUMERIC;
BEGIN
  utility_due_amount := (SELECT SUM(amount_to_pay) FROM utilities_report WHERE rental_contract_id = contract_id AND utility_due_date < due_date AND utility_paid = '0');
  RETURN utility_due_amount;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION rental_cost(contract_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
  rental_days INTEGER;
  daily_rate NUMERIC;
  rental_cost NUMERIC;
BEGIN
  rental_days := calculate_rental_days(contract_id);
  daily_rate := (SELECT rent_rate FROM rental_contract WHERE rental_contract.contract_id = rental_cost.contract_id);
  rental_cost := rental_days * daily_rate;
  RETURN rental_cost;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION calculate_remaining_security_deposit(security_deposit_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
  amount_paid NUMERIC;
  amount_used NUMERIC;
  remaining_security_deposit NUMERIC;
BEGIN
  SELECT security_deposit.amount_paid, security_deposit.amount_used INTO amount_paid, amount_used
  FROM security_deposit
  WHERE security_deposit.security_deposit_id = calculate_remaining_security_deposit.security_deposit_id;
  remaining_security_deposit := amount_paid - amount_used;
  RETURN remaining_security_deposit;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION send_payment_reminder()
RETURNS VOID AS $$
DECLARE
    contract_id INTEGER;
BEGIN
    FOR contract_id IN (SELECT rental_contract_id FROM rent_report WHERE rent_due_date = NOW()::DATE)
    LOOP
        RAISE NOTICE 'Reminder: Payment for contract % is due today', contract_id;
    END LOOP;
END;
$$ LANGUAGE plpgsql;