const express = require('express');
const router = express.Router();
const reviewController = require('../controllers/Review.Controller');

/* GET users listing. */
router.get('/postReview', reviewController.getreview);
router.post('/postReview', reviewController.postreview);

module.exports = router;