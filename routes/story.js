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

router.get("/", (req, res)=>{
    // if user is logged in, redirect to home page
    if(req.isAuthenticated()){
        res.redirect("/home")
    }
    else{
        res.render("index");
    }
});

router.get("/register", (req, res)=>{
    // if user is logged in, redirect to home page
    if(req.isAuthenticated()){
        res.redirect("/home")
    }
    else{
        res.render("register");
    }
});

router.get("/login", (req, res)=>{
    // if user is logged in, redirect to home page
    if(req.isAuthenticated()){
        res.redirect("/home")
    }
    else{
        res.render("login");
    }
});

router.get("/home", async (req, res)=>{
    if(!req.isAuthenticated()){
        res.render("index")
    }
    try{
        // fetch all stories from db
        const allStories = await Story.find();
        res.render("home", {allStories, isAuth:req.isAuthenticated() });

    }catch(err){
        res.send(err);
    }
});

router.get("/submit", (req, res)=>{
    // if user is logged in, stay on submit page
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

        story.save();

        // redirect to home if sucessful
        res.redirect("/home");
    }catch{
        console.log("fail");
        res.redirect("/submit");
    }
});

router.get ( '/identity', getIdentity );
function getIdentity(req, res){
    try{                                    // if successful, go to home
        res.render("identity");
    }
    catch{                                  // if not successful, stay on story (index.ejs)
        res.render("identity");
    }
}

router.get("/login", (req, res)=>{
    // if user is logged in, redirect to home page
    if(req.isAuthenticated()){
        res.redirect("/home")
    }
    else{
        res.render("login");
    }
});

router.post ( '/identity', postIdentity );
function postIdentity(req, res){
    try{                                    // if successful, go to home
        res.redirect ( '/identity' );
    }
    catch{                                  // if not successful, stay on story (index.ejs)
        res.redirect('/home');
    }
}

module.exports = router;