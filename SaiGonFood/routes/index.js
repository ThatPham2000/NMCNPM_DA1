const express = require('express');
const router = express.Router();
const dishController = require('../controllers/Dish.Controller');
/* GET home page. */
router.get('/', function(req, res, next) {
    req.session.rating = 4.5;
    req.session.num_rating = 25;
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
    res.render("blog", {
        reviewpost: review,
    });
});

router.get('/contact', function(req, res, next) {
    res.render('contact');
});

router.get('/restaurant_detail', dishController.getAlldish);

router.get('/restaurants', function(req, res, next) {
    res.render('restaurants');
});

router.get('/search', dishController.search)

router.get('/single-post', function(req, res, next) {
    res.render('single-post');
});

router.get('/single-food', dishController.dish);
router.post('/rating', dishController.rating);
router.get('/comment', dishController.comment);
router.post('/comment', dishController.comment);
module.exports = router;