import {connection } from "./db.js";

export const propertiesQueries = {
    fetchPropertiesForTenants: async () => {
        const properties = await connection`
        select p.property_id, pt.property_tpe_name as property_type, 
        p.landlord_oib, p.property_name, p.property_size, 
        a.house_number, s.street_name, t.town_name, c.country_name, 
        p.property_value, p.description, p.status 
        from public.property p 
        left outer join public.property_type pt on pt.property_type_id=p.property_type_id 
        left outer join public.address a on a.address_id=p.address_id 
        left outer join public.street s on a.street_id=s.street_id 
        left outer join public.town t on s.town_id=t.town_id 
        left outer join public.country c on c.country_id=t.country_id 
        where p.status='free' 
        fetch first 50 rows only;
        `;

        return properties;
    },

    fetchSingleProperty: async (propertyId) => {
        const property = await connection`
        select p.property_id, pt.property_tpe_name, p.property_name,
        p.property_size, p.property_value, p.description,
        u.email, u.first_name, u.last_name, u.phone_number 
        from public.property p
        left outer join public.property_type pt on p.property_type_id=pt.property_type_id 
        left outer join public.user u on p.landlord_oib=u."OIB" 
        where p.property_id=${propertyId};
        `;

        return property[0];
    },

    fetchContractsForTenants: async (tenantOIB) => {
        const contracts = await connection`
        select c.contract_id, c.check_in::date, c.check_out::date, c.rent_rate, c.contract_date 
        from public.rental_contract c
        where c.tenant_oib = ${tenantOIB}
        `;

        return contracts;
    },

    fetchUtilitiesForTenants: async (contractID) => {
        const utilities = await connection`
        select u.amount_to_pay, u.utility_due_date::date, u.utility_paid, ut.utility_type_name
        from public.utilities_report u 
        left outer join public.utility_type ut on ut.utility_type_id = u.utility_type_id 
        where u.rental_contract_id=${contractID} 
        fetch first 50 rows only;
        `;

        return utilities;
    },
    fetchSecurityForTenants: async (contractID) => {
        const security = await connection`
        select s.amount_paid,s.amount_used, s."used_for_JSON"
        from public.security_deposit s 
        left outer join public.rental_contract c ON c.security_deposit_id = s.security_deposit_id 
        where c.contract_id = 1
        `;

        return security;
    },

    
    fetchRentsForTenants: async (tenantOIB) => {
        const rents = await connection`
        select r.rent_due_date,r.rent_paid, c.rent_rate , p.property_name
        from public.rent_report r
		left outer join public.rental_contract c ON c.contract_id = r.rental_contract_id 
		left outer join public.property p  ON p.property_id = c.property_id
        where c.tenant_oib = ${tenantOIB}
        `;

        return rents;
    },

    fetchContractDocument: async (contractID) => {
        const contractBlob = await connection`
        select contract_document 
        from rental_contract
        where contract_id=${contractID}
        `


        return contractBlob[0];
    },

    fetchPropertyHistory: async (propertyId) => {
        const propertyHistory = await connection`
        select p.property_name, h.last_renovation_year, h."yearly_data_JSON" 
        from property p 
        left outer join property_history h  on p.property_history_id = h.property_history_id
        where p.property_id = ${propertyId}
        `

        return propertyHistory;
    }
}