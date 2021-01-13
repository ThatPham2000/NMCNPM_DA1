const express = require('express');
const router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index');
});

router.get('/index', function(req, res, next) {
    res.render('index');
});

router.get('/about', function(req, res, next) {
    res.render('about');
});

router.get('/blog', function(req, res, next) {
    res.render('blog');
});

router.get('/contact', function(req, res, next) {
    res.render('contact');
});

router.get('/restaurant', function(req, res, next) {
    res.render('restaurant');
});

router.get('/restaurant2', function(req, res, next) {
    res.render('restaurant2');
});

router.get('/single-post', function(req, res, next) {
    res.render('single-post');
});

module.exports = router;