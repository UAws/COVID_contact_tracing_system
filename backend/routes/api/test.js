var express = require('express');
const {User} = require("../../entity/User.ts");
const {getRepository} = require("typeorm");
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {

    const users = getRepository(User).find();
    res.send(users);
});

module.exports = router;
