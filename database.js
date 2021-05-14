
const { Client } = require('pg');
const client = new Client({
    user: 'alive.czszlx8shwgt.eu-west-1.rds.amazonaws.com',
    host: 'postgres',
    database: 'alive',
    password: 'FailFast2021',
    port: 5432,
})
client.connect()
client.query('SELECT NOW()', (err, res) => {
    console.log(err, res)
    // client.end()
})

module.exports = client;