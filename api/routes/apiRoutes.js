'use strict';
module.exports = function(app) {
  var data = require('../controllers/apiController');

  // todoList Routes
  app.route('/items')
    .get(data.list_all)
    .post(data.create_item);


  app.route('/items/:objId')
    .get(data.read_item)
    .put(data.update_item)
    .delete(data.delete_item);
  app.route('/contact/:usrId')
	.get(data.getContact);
};