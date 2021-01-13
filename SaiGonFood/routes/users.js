const express = require('express');
const router = express.Router();
const userController = require('../controllers/User.Controller');

/* GET users listing. */
router.get('/login', userController.login);
router.post('/login', userController.login);

router.get('/register', userController.register);
router.post('/register', userController.register);

module.exports = router;