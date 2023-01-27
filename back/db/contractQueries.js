import db from "./pg.js";


export const contractQueries = {
    createContract: async(obj) => {
        const createContract = await db.func('create_security_deposit_and_rental_contract', [
            parseFloat(obj.rent_rate), obj.property_id, obj.tenant_oib, obj.check_in, obj.check_out, parseInt(obj.rent_rate), obj.check_in, obj.contract_document
        ]);
        return createContract;
    },
    fetchReminders: async(contractId) => {
        const fetchReminder = await db.func('send_payment_reminder', [
            contractId
        ]);
        return fetchReminder;
    },
    fetchMaintenance: async(property_id) => {
        const maintenance = await db.func('get_property_maintenance', [
            property_id
        ]);
        return maintenance;
    },
    addFeat: async(obj) => {
        const feat = await db.func('update_property_features', [
            parseInt(obj.property), ['numberOfParkingSpaces'], obj.value
        ]);
        return feat
    }
}