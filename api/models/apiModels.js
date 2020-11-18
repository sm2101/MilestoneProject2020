'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var DataSchema = new Schema({
	usrId:String,
	item:String,
	qty:Number,
	price:Number
	
});

module.exports = mongoose.model('datas', DataSchema);