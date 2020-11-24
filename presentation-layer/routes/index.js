var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.json({
    running: true,
  });
});

router.get('/foo', function (req, res, next) {
  res.json({
    foo: 'bar',
  });
});

router.get('/single-layer', function (req, res) {
  res.json({
    success: true,
    layers: 1,
  });
});

module.exports = router;
