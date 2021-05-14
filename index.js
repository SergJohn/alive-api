const express = require('express');
const app = express();
const cors = require('cors');
const client = require('./database');

app.use(express.json());
app.use(express.static(__dirname));
app.use(cors());
app.use(express.urlencoded({ extended: false }));

app.post("/create-user", async (req, res) => {

    try {
        // Checking data
        console.log(req.body);

        // Getting the values from frontend
        var id = req.body.id.toString();
        var firstName = req.body.firstName.toString();
        var surname = req.body.surname.toString();
        var displayName = req.body.displayName.toString();
        var password = req.body.password.toString();
        var dob = req.body.dob.toString();
        var avatar = req.body.avatar.toString();
        var bio = req.body.bio.toString();
        var following = req.body.following.toString();
        var obs_config_rmrplink = req.body.obs_config_rmrplink.toString();
        var obs_config_streamkey = req.body.obs_config_streamkey.toString();
        var live_uri = req.body.live_uri.toString();
        var live_image = req.body.live_image.toString();


        // Inserting the values to the db
        const newUser = await client.query(
            "INSERT INTO users VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13); RETURNING *", 
            [id, firstName, surname, displayName, password, dob, avatar, bio, following, obs_config_rmrplink, obs_config_streamkey, live_uri, live_image]
        );

        res.json({ newUser });

    } catch (error) {
        console.log(error.message);
        res.status(500).send("server Error");
    }


});

app.put("/update-user/:id", async (req, res) => {

    try {

        var id = req.params.id.toString().trim();
        console.log(id);

         // Getting the values from frontend
         var firstName = req.body.firstName.toString();
         var surname = req.body.surname.toString();
         var displayName = req.body.displayName.toString();
         var password = req.body.password.toString();
         var dob = req.body.dob.toString();
         var avatar = req.body.avatar.toString();
         var bio = req.body.bio.toString();
         var following = req.body.following.toString();
         var obs_config_rmrplink = req.body.obs_config_rmrplink.toString();
         var obs_config_streamkey = req.body.obs_config_streamkey.toString();
         var live_uri = req.body.live_uri.toString();
         var live_image = req.body.live_image.toString();

        if (firstName && surname && displayName && password && dob && avatar && bio && following && obs_config_rmrplink && obs_config_streamkey && live_uri && live_image) {
            const userUpdate = await client.query("UPDATE users SET firstName = $2, surname = $3, displayName = $4, password = $5, dob = $6, avatar = $7, bio = $8, following = $9, obs_config_rmrplink = $10, obs_config_streamkey = $11, live_uri = $12, live_image = $13   WHERE user_id = $1", 
            [id, firstName, surname, displayName, password, dob, avatar, bio, following, obs_config_rmrplink, obs_config_streamkey, live_uri, live_image]);
            res.status(200).send("User Updated");
        } else {
            console.log("Fill the required fields");
        }



    } catch (error) {
        console.log(error.message);
        res.status(500).send("server Error");
    }

});

app.post("/follow/:userId/:userToFollowId", async (req, res) => {

    try {
        var userId = req.params.userId.toString().trim();
        var userToFollowId = req.params.userToFollowId.toString().trim();

        const followers = client.query("UPDATE users SET following = $2 WHERE user_id = $1", [userId, userToFollowId]);
        
        res.status(200).send(followers);

        //  '{{"meeting", "lunch"}, {"meeting"}}');
        
    } catch (error) {
        console.log(error.message);
        res.status(500).send("server Error");
    }

});

app.post("/unfollow/:userId/:userToUnFollowId", async (req, res) => {

    try {
        var userId = req.params.userId.toString().trim();
        var userToUnFollowId = req.params.userToUnFollowId.toString().trim();

        const followers = client.query("DELETE following = $2 FROM users WHERE user_id = $1", [userId, userToUnFollowId]);
        
        res.status(200).send(followers);

        
    } catch (error) {
        console.log(error.message);
        res.status(500).send("server Error");
    }

});

app.get("/followers/:userId", async (req, res) => {
    try {
        var userId = req.params.userId.toString().trim();

        const followers = client.query("SELECT following FROM users WHERE user_id = $1", [userId]);
        
        res.status(200).send(followers);

        
    } catch (error) {
        console.log(error.message);
        res.status(500).send("server Error");
    }
});

app.get("/users", async (req, res) => {

    try {

        const users = await client.query("SELECT * FROM users;");
        // users.rows.map(item => ({
        //     ...item,
        //     id: item.user_id,
        //     live: {
        //         uri: item.live_uri,
        //         image: item.live_image
        //     },
        //     obs_config: {
        //         rmrpLink: item.obs_config_rmrplink,
        //         streamKey: item.obs_config_streamkey
        //     }
        // }))

        res.status(200).send(users);

    } catch (error) {
        console.log(error);
    }
});

app.listen(process.env.PORT, () => console.log('server running'));