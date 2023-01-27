import postgres from "postgres";

export const connection = postgres({
    host: "localhost",
    port: 5432,
    database: "TEAM_1_JCC_DB",
    username: "postgres",
    password: "postgres"
});