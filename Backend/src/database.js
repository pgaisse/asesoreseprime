const mysql = require('mysql2/promise');
const { database } = require('./backup/keys');

// Crear pool con promesas directamente (no usar promisify)
const pool = mysql.createPool(database);

// Verificación de conexión
(async () => {
  try {
    const connection = await pool.getConnection();
    console.log('DB is Connected');
    connection.release();
  } catch (err) {
    console.error('DB connection failed:', err.message);
  }
})();

module.exports = pool;
