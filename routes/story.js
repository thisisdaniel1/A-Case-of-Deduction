// require express router multer
const router = require("express").Router();
const multer = require("multer");

var fs = require("fs");
 
var storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads')
    },
    filename: (req, file, cb) => {
        cb(null, file.fieldname + '-' + Date.now())
    }
});

// require Story model
const Story = require("../models/Story");
var upload = multer({storage: storage});

// create routes
// get home
router.get("/", (req, res)=>{
    // if user is logged in, redirect to home page
    if(req.isAuthenticated()){
        res.redirect("/home")
    }
    else{
        res.render("index");
    }
});

// get register page
router.get("/register", (req, res)=>{
    // if user is logged in, redirect to home page
    if(req.isAuthenticated()){
        res.redirect("/home")
    }
    else{
        res.render("register");
    }
});

// login page
router.get("/login", (req, res)=>{
    // if user is logged in, redirect to home page
    if(req.isAuthenticated()){
        res.redirect("/home")
    }
    else{
        res.render("login");
    }
});

/* get stories page (fetch data from db and send to stories page)
router.get("/home", async (req, res)=>{
    try{
        // fetch all stories from db
        const allStories = await Story.find();
        res.render("home", {allStories, isAuth:req.isAuthenticated() });

    }catch(err){
        res.send(err);
    }
});
*/

// get submit page
router.get("/submit", (req, res)=>{
    // if user is logged in, redirect to submit page
    if(req.isAuthenticated()){
        res.render("submit")
    }
    else{
        res.redirect("/register");
    }
});

// post submit, submit a story and data to db
router.post("/submit", upload.single("image"), async (req, res) => {
    try{
        const story = new Story({
            name: req.body.name,
            /*
            img:{
                data: fs.readFileSync(path.join(__dirname + "/views/assets/" + req.file.filename)),
                contentType: "image/png"
            }
            */
        });
        /*
        const savedImage = await Story.create(story);
        res.send(savedImage);
        */

        const saveStory = story.save();
        // !saveStory && res.redirect("/submit");

        // redirect to home if sucessful
        res.redirect("/home");
    }catch{
        console.log("fail");
        res.redirect("/submit");
    }
});



// ratings

module.exports = router;