const { Pool } = require('pg');
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'postgres',
    password: 'Jadvian,',
    port: 5432, // Default port for PostgreSQL
});

module.exports = pool;