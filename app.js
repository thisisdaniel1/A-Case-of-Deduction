require("dotenv").config();
const express = require("express");
const port = 3000 ;
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const session = require("express-session");
const passport = require("passport");
const ejs = require("ejs");

const authRoute = require("./routes/auth");
const storyRoute = require("./routes/story");

//setup app
const app = express();

//setup view engine EJS, body-parser, and express-static
app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));
app.use("/images", express.static("images"));

// setup session
app.use(session({
    secret: process.env.SECRET,
    resave: false,
    saveUninitialized: false
}));

// initialize passport
app.use(passport.initialize());

// use passport to deal with session
app.use(passport.session());

// use routes
app.use("/", authRoute);
app.use("/", storyRoute);

// import db config settings
const { database } = require ('./config/database');
const mongoose_config = {useNewUrlParser: true, useUnifiedTopology: true};  //connection configs
const connection = mongoose.connect(database, mongoose_config);             //connect to mongo server
app . listen ( port , () => console . log ( `listening on... ${ port } ` ) );

if (connection){
    console.log("database connected");
}
else{
    console.log("database connection error")
}

app.get("/", (req, res)=>{
    res.render("index.ejs")
});

app.get("/register", (req, res)=>{
    res.render("register.ejs")
});

app.get("/login", (req, res)=>{
    res.render("login.ejs")
});

app.get("/home", (req, res)=>{
    res.render("home.ejs")
});

app.get("/submit", (req, res)=>{
    res.render("submit.ejs")
});

app.get("/identity", (req, res)=>{
    res.render("identity.ejs")
});
