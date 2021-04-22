var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.send("express");
});

router.use('/api', require('./api'));

module.exports = router;
