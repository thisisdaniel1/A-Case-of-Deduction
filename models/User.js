// require mongoose, passport-local-mongoose
const mongoose = require("mongoose");
const passportLocalMongoose = require("passport-local-mongoose");

// create user schema
const userSchema = new mongoose.Schema({
    username: String,
    email: String,
    password: String
});

// hash password using passport-local-mongoose plugin
userSchema.plugin(passportLocalMongoose);

// export User model
module.exports = mongoose.model("User", userSchema);