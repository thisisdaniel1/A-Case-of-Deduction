if ( process . env . NODE_ENV !== 'production' ){
    require ( 'dotenv' ). config ()
   }

const express = require ( 'express' );
const app = express ();
const port = 3000 ;
const bodyParser = require ( 'body-parser' );
const session = require ( 'express-session' );
const passport = require ( './middlewares/passport-config' );
const userRoutes = require ( './routes/user-routes' );
const flash = require ( 'express-flash' );


function setupApp (){
    app.use(express.static(__dirname + '/views'));
    app . set ( 'view-engine' , 'ejs' );
    app . use ( bodyParser . urlencoded ({ extended: false }) );
    const sessionConfig = { secret: process.env.SESSION, resave:false,saveUninitialized:true };
    app . use ( session ( sessionConfig ) );
    app . use ( passport . initialize () );
    app . use ( passport . session () );
    app . use ( '/' , userRoutes );
   }

setupApp ();
app . listen ( port , () => console . log ( `listening on... ${ port } ` ) );