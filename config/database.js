// config/database.js
const mysql = require('mysql');

const connection = mysql.createConnection({ 
    host: '127.0.0.1',
    user: 'root',
    password: 'Holasoytu.58',
    database: 'tiendaweb'
});

connection.connect((err) => {   
    if (err) {
        console.error('Error de conexión a la base de datos: ' + err.stack);
        return;
    }
    console.log('Conexión exitosa a la base de datos.');
});

module.exports = connection;