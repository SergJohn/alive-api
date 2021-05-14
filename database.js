
const { Client } = require('pg');
const client = new Client({
    host: 'alive.czszlx8shwgt.eu-west-1.rds.amazonaws.com',
    user: 'postgres',
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