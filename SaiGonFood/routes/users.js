var express = require('express');
var router = express.Router();
const userController = require('../controllers/User.Controller');

/* GET users listing. */
router.get('/', userController.login);
router.get('/login', userController.login);
router.get('/logout', userController.logout);

module.exports = router;