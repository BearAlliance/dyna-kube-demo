var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/api/single-layer', function (req, res) {
  res.json({
    success: true,
    layers: 1,
  });
});

module.exports = router;
