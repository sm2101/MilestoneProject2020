var mongoose = require('mongoose'),
  Data = mongoose.model('datas'),
	usrData = mongoose.model('user');

exports.list_all = function(req, res) {
  Data.find({}, function(err, pdata) {
    if (err)
      res.send(err);
    res.json(pdata);
  });
};




exports.create_item = function(req, res) {
  var new_Data = new Data({
	  usrId:req.body.usrId,
	  item:req.body.item,
	  qty:req.body.qty,
	  price:req.body.price
  });
	console.log(new_Data);
  new_Data.save(function(err, pdata) {
    if (err)
      res.send(err);
    res.json(pdata);
  });
};


exports.read_item = function(req, res) {
  Data.findById(req.params.usrId, function(err, pdata) {
    if (err)
      res.send(err);
    res.json(pdata);
  });
};


exports.update_item = function(req, res) {
  Data.findOneAndUpdate({_id: req.params.usrId}, req.body, {new: true}, function(err, pdata) {
    if (err)
      res.send(err);
    res.json(pdata);
  });
};


exports.delete_item = function(req, res) {

console.log(req.params.objId);
  Data.deleteOne({
    _id: req.params.objId
  }, function(err, pdata) {
    if (err)
      res.send(err);
    Data.find({}, function(err, pdata) {
    if (err)
      res.send(err);
    res.json(pdata);
  });
  });
};

exports.getContact = function(req, res) {
  usrData.findById(req.params.usrId, function(err, pdata) {
    if (err)
      res.send(err);
    res.json(pdata);
  });
};

