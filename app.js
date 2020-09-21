const express = require('express'),
      app = express(),
      bodyParser = require('body-parser'),
      port = process.env.PORT || 3000,
	  mongoose = require('mongoose');
// --------------------------------------------
app.set('view engine','ejs');
app.use(express.static("public"));
// --------------------------------------------
app.get("/",(req,res) =>{
    res.render("home");
})
app.get("/login",(req,res) =>{
    res.render("login");
})
app.get("/signup",(req,res) =>{
    res.render("signup");
})
// --------------------------------------------
app.listen(port,()=>{
    console.log("server is up");
})