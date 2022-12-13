const express = require('express');
const User = require('../models/user');
const bcrypt = require('bcryptjs');

const authRouter = express.Router();

// authRouter.get('/user', (req, res) => {
//     res.json({name:'Meraj'});
// });

//SIGNUP Route
authRouter.post('/api/signup', async function (req, res) {
    //get the data from the CLIENT
    try {
        const {name, email, password} = req.body;
    
        const existingUser = await User.findOne({email });
        if (existingUser) {
            res.status(400).json({msg: 'User already exists'});
        }

        const hashedPassword = await bcryptjs.hash(password, 8);
    
        let user = new User({
            email,
            password: hashedPassword,
            name,
        })
        user = await user.save(); // version, id
        res.json(user);
        //post that data in database
        //return that data to the user

    } catch (e) {
        res.status(500).json({error: e.message});
    }
    

});

module.exports = authRouter;