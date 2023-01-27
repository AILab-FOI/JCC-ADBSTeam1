import pgPromise from 'pg-promise';
const pgp = pgPromise();
const cn = 'postgres://postgres:postgres@localhost:5432/TEAM_1_JCC_DB'
const db = pgp(cn);

export default db;