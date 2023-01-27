ALTER SEQUENCE public.address_id_seq RESTART WITH 115000;
ALTER SEQUENCE public.country_id_seq RESTART WITH 3;
ALTER SEQUENCE public.maintenance_report_maintenance_report_id_seq RESTART WITH 150508;
ALTER SEQUENCE public.maintenance_type_maintenance_type_id_seq RESTART WITH 6;
ALTER SEQUENCE public.property_history_id_seq RESTART WITH 115000;
ALTER SEQUENCE public.property_id_seq RESTART WITH 115000;
ALTER SEQUENCE public.property_type_id_seq RESTART WITH 3;
ALTER SEQUENCE public.rent_report_rent_report_id_seq RESTART WITH 100244;
ALTER SEQUENCE public.rental_contract_contract_id_seq RESTART WITH 100244;
ALTER SEQUENCE public.security_deposit_security_deposit_id_seq RESTART WITH 100244;
ALTER SEQUENCE public.street_id_seq RESTART WITH 5000;
ALTER SEQUENCE public.town_id_seq RESTART WITH 26;
ALTER SEQUENCE public.user_role_id_seq RESTART WITH 3;
ALTER SEQUENCE public.utilities_report_utilities_report_id_seq RESTART WITH 190690;
ALTER SEQUENCE public.utility_type_utility_type_id_seq RESTART WITH 6;

CREATE OR REPLACE FUNCTION create_security_deposit_and_rental_contract (
    amount_paid NUMERIC,
    property_id INTEGER,
    tenant_oib TEXT,
    check_in DATE,
    check_out DATE,
    contract_date DATE,
    contract_document TEXT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO security_deposit (security_deposit_id, amount_paid, amount_used, "used_for_JSON") 
    VALUES (DEFAULT, amount_paid, 0, json_build_object('paid', amount_paid, 'used', 0, 'history', ''));

    INSERT INTO rental_contract (contract_id, property_id, tenant_oib, check_in, check_out, rent_rate, security_deposit_id, contract_date, contract_document)
    VALUES (DEFAULT, property_id, tenant_oib, check_in, check_out, amount_paid, currval('security_deposit_security_deposit_id_seq'), contract_date, contract_document);
END;
$$ LANGUAGE plpgsql; 

CREATE OR REPLACE FUNCTION update_property_status()
RETURNS TRIGGER AS $$
DECLARE
BEGIN
    UPDATE property SET "status" = 'leased' WHERE property_id = NEW.property_id;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_property_status_trigger
AFTER INSERT ON rental_contract
FOR EACH ROW
EXECUTE FUNCTION update_property_status();

CREATE OR REPLACE FUNCTION update_utility_paid()
RETURNS TRIGGER AS $$
DECLARE
BEGIN
    UPDATE utility_report SET "utility_paid" = '0' WHERE rental_contract_id = NEW.contract_id;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_utility_paid_trigger
AFTER INSERT ON rental_contract
FOR EACH ROW
EXECUTE FUNCTION update_utility_paid(); 

CREATE OR REPLACE FUNCTION insert_rent_report()
RETURNS TRIGGER AS $$
DECLARE
BEGIN
    INSERT INTO rent_report (rental_contract_id, rent_due_date, rent_paid) VALUES (NEW.contract_id, now()::date, '0');
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER insert_rent_report_trigger
AFTER INSERT ON rental_contract
FOR EACH ROW
EXECUTE FUNCTION insert_rent_report(); 

CREATE OR REPLACE FUNCTION get_property_maintenance(property_id INTEGER)
RETURNS TABLE(maintenance_type_name TEXT, maintenance_date DATE) AS $$
BEGIN
    RETURN QUERY 
    SELECT maintenance_type.maintenance_type_name, maintenance_report.maintenance_date
    FROM maintenance_report
    JOIN maintenance_report_property ON maintenance_report.maintenance_report_id = maintenance_report_property.maintenance_report_id
    JOIN maintenance_type ON maintenance_report.maintenance_type_id = maintenance_type.maintenance_type_id
    WHERE maintenance_report_property.property_id = get_property_maintenance.property_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_property_maintenance(property_id INTEGER)
RETURNS TABLE(maintenance_type_name TEXT, maintenance_date DATE) AS $$
BEGIN
    RETURN QUERY 
    SELECT maintenance_type.maintenance_type_name, maintenance_report.maintenance_date
    FROM maintenance_report
    JOIN maintenance_report_property ON maintenance_report.maintenance_report_id = maintenance_report_property.maintenance_report_id
    JOIN maintenance_type ON maintenance_report.maintenance_type_id = maintenance_type.maintenance_type_id
    WHERE maintenance_report_property.property_id = get_property_maintenance.property_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_property_features(property_id INTEGER, feature TEXT[], new_value TEXT)
RETURNS VOID AS $$
BEGIN
    UPDATE property
    SET "features_JSON" = JSONB_SET("features_JSON"::JSONB, feature, new_value::JSONB)
    WHERE property.property_id = update_property_features.property_id;
END;
$$ LANGUAGE plpgsql;