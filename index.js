const express = require('express');
const app = express();

const client = require('./database');

app.use(express.json());
app.use(express.static(__dirname));
app.use(express.urlencoded({ extended: false }));

app.get("/users", async (req, res) => {

    try {

        const users = await client.query("SELECT * FROM users;");

        res.status(200).send(users);
        
    } catch (error) {
        console.log(error);
    }
});

app.listen(process.env.PORT, () => console.log('server running'));