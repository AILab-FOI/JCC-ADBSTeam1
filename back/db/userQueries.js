import {connection } from "./db.js";

export const userQueries = {
    fetchUser: async (oib) => {
        const user = await connection`
        select "OIB", first_name, last_name, email, user_role_id 
        from public.user 
        where "OIB"=${oib};
        `;

        return user[0];
    }
}