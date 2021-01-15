const express = require('express');
const router = express.Router();
const dishController = require('../controllers/Dish.Controller');
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
    const review = db.get('review').value();
    res.render("blog",{
        reviewpost: review,
    });
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

router.get('/single-food', dishController.dish);
router.post('/rating',dishController.rating);
router.get('/comment', dishController.comment);
router.post('/comment', dishController.comment);
module.exports = router;