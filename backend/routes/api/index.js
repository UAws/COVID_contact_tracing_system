var express = require('express');
var router = express.Router();

router.use('/test',require('./test'));

/* GET home page. */
router.get('/', function(req, res, next) {
    res.send("express");
});

module.exports = router;
