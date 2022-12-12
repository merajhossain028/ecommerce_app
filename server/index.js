//creating an API

//Like import 'package:express' from 'node_modules
//Imports form packages
const express = require('express');
const mongoose = require('mongoose');
//Imports from other files
const authRouter = require('./routes/auth');
//INTL
const PORT = 3000;
const app = express(); //express into a variable
const DB = 'mongodb+srv://meraj:meraj028@cluster0.0ntlpkk.mongodb.net/?retryWrites=true&w=majority';

//middleware
//CLIENT -> middlewear -> SERVER -> CLIENT
app.use(authRouter); //middleware

//Connect to the database
mongoose.connect(DB).then(() => {
    console.log('Database connected');
}).catch((err) => {
    console.log(err);
});


//Lets create API
//http://localhost:3000/hello-world

// app.get('/', function(req, res){
//     res.json({name:'Meraj'});
// }); //get request


// app.get('/hello-world', function(req, res){
//     res.json({hi:'Hello World'});
// });
//GET, PUT, POST, DELETE, UPDATE -> CRUD
app.listen(PORT, '0.0.0.0', function(){
    console.log(`Server is running on PORT ${PORT}`);
});