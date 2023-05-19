// require express router, passport
const router = require("express").Router();
const passport = require("passport");

// User model
const User = require("../models/User");

// create passport local strategy
passport.use(User.createStrategy());

/*
passport.serializeUser(function(user, done){
    done(null, user.id);
});
passport.deserializeUser(function(id, done){
    User.findById(id, function(err, user){
        done(err, user);
    });
});
*/

passport.serializeUser(function(user, done) {
    done(null, user);
});
  
passport.deserializeUser(function(user, done) {
    done(null, user);
});

// register user in db
router.post("/auth/register", async (req, res)=>{
    try{
        // register user, register() => is a passport method from passport-local-mongoose
        const registerUser = await User.register({username:req.body.username, email:req.body.email}, req.body.password);
        if(registerUser){
            passport.authenticate("local")(req, res, function(){
                res.redirect("/login");
            });
        }
        else{
            res.redirect("/register");
        }
    }catch(err){
        res.send(err);
    }
});

// login user
router.post("/auth/login", (req, res)=>{
    // create new user object
    const user = new User({
        username: req.body.username,
        password: req.body.password
    });

    // using passport login method we will check if user credentials are correct or not
    req.login(user, (err)=>{
        if(err){
            console.log(err)
        }else{
            passport.authenticate("local")(req, res, function(){
                res.redirect("/home");
            });
        }
    });
});

// logout user
router.get("/auth/logout", function(req, res, next){
    // use passport logout method
    req.logout(function(err){
        if(err){
            return next(err);
        }
        res.redirect("/");
    });
});

router . get ( '/identity', getIdentity );
function getIdentity(req, response){
    try{                                    // if successful, go to home
        response.render("identity");
    }
    catch{                                  // if not successful, stay on story (index.ejs)
        response.render("identity");
    }
}

router . post ( '/identity', postIdentity );
function postIdentity(request, response){
    try{                                    // if successful, go to home
        response . redirect ( '/identity' );
    }
    catch{                                  // if not successful, stay on story (index.ejs)
        response.redirect('/home');
    }
}

// export router
module.exports = router;