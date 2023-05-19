// require mongoose
const mongoose = require("mongoose");

// create story schema
const storySchema = new mongoose.Schema({
    name: String,
    image:{
        data: Buffer,
        contentType: String
    },
    rating:{
        type: Number,
        default:0
    }
});

// export User model
module.exports = mongoose.model("Story", storySchema);