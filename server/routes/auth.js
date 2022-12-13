const express = require('express');
const User = require('../models/user');

const authRouter = express.Router();

// authRouter.get('/user', (req, res) => {
//     res.json({name:'Meraj'});
// });
authRouter.post('/api/signup', (req, res) => {
    //get the data from the CLIENT
    const {name, email, password} = req.body;

    User.findOne()
    //post that data in database
    //return that data to the user
    

});

module.exports = authRouter;