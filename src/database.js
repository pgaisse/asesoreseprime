const mysql = require('mysql');
const { promisify }= require('util');
let pool;

const { database } = require('./keys')
pool = mysql.createPool(database);



pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === 'PROTOCOL_CONNECTION_LOST') {
      console.error('Database connection was closed.');
    }
    if (err.code === 'ER_CON_COUNT_ERROR') {
      console.error('Database has to many connections');
    }
    if (err.code === 'ECONNREFUSED') {
      console.error('Database connection was refused');
    }
  }
  if (connection) connection.release();
    console.log('DB is Connected');
});



    


// Promisify Pool Querys
pool.query = promisify(pool.query);
  pool.end = promisify(pool.end);



async function exQuery(string){    

  const query = await pool.query(string)
  return query
}

module.exports = {pool, exQuery};
