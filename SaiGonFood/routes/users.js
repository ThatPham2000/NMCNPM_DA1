var express = require('express');
var router = express.Router();
const userController = require('../controllers/User.Controller');

/* GET users listing. */
router.get('/', userController.login);
router.get('/login', userController.login);
router.get('/register', userController.register);

module.exports = router;