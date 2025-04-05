const mysql = require('mysql');
const { promisify }= require('util');

const { database } = require('./backup/keys')
const pool = mysql.createPool(database);



pool.getConnection((err, connection) => {
  try{
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
  }
  catch{
    console.log('DB is not Connected');
  }
});



    


// Promisify Pool Querys
pool.query = promisify(pool.query);

module.exports = pool;
