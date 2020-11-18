const express = require('express'),
      app = express(),
      bodyParser = require("body-parser"),
      expressSession = require("express-session"),
      mongoose = require("mongoose"),
	  request = require("request"),
	  passport = require("passport"),
	  local = require("passport-local").Strategy,
	  passLocalMong = require("passport-local-mongoose"),
	  Task = require('./api/models/apiModels'),
	  user = require("./models/users"),
      port = process.env.PORT || 3000;
// --------------------------------------------
	mongoose.connect("mongodb://localhost:27017/anndata_data",{useNewUrlParser: true,useUnifiedTopology: true});
app.use(bodyParser.urlencoded({extended: true}));
app.set('view engine','ejs');
app.use(express.static("public"));
app.use(expressSession({
	secret: "asjkdnkjsbduablaeybfahbjdfhsbghsl",
	resave: false,
	saveUninitialized: false
}));
app.use(passport.initialize());
app.use(passport.session());

passport.use(new local(user.authenticate()));
passport.serializeUser(user.serializeUser());
passport.deserializeUser(user.deserializeUser());
var apiRoutes = require('./api/routes/apiRoutes'); //importing route
apiRoutes(app);

// --------------------------------------------
app.get("/",(req,res) =>{
	if(req.user){
		res.redirect("/user");
	} else{
    	res.render("home",{currentUser:req.user});
	}
})
app.get("/team",(req,res) =>{
    res.render("team",{currentUser:req.user});
})
app.get("/tc",(req,res) =>{
    res.render("tandc",{currentUser:req.user});
})
app.get("/user",(req,res) =>{
	res.set('Access-Control-Allow-Origin', '*');
	res.set('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
	res.render("profile",{currentUser:req.user});
	
})
// ------------------Signin Routes --------------

app.get("/signin",(req,res) =>{
    res.render("login",{currentUser:req.user});
})
app.post("/signin",passport.authenticate("local",{
	successRedirect: "/",
	failureRedirect: "/signin",
	// failureFlash: true
}),
	(req,res) =>{
})

// ------------------Signup Routes --------------

app.get("/signup",(req,res) =>{
    res.render("signup",{currentUser:req.user});
})
app.post("/signup",(req,res) =>{
		
	user.register(new user({
		username: req.body.username,
		uname: req.body.uname,
		occ: req.body.uOcc,
		dob: req.body.uDOB,
		GST:req.body.uGST
		
	}), req.body.password, function(err,user){
		if(err){
			console.log(err);
			console.log(req.body.username);
			return res.render('signup',{currentUser:req.user})
		}
		passport.authenticate("local")(req,res,function(){
			res.redirect("/user");
		});
	});
})

// ------------------Logout Routes --------------

app.get("/logout",(req,res) =>{
// 	logout
	req.logout();
	res.redirect("/");
})
// --------------------------------------------
app.listen(port,()=>{
    console.log("server is up");
})