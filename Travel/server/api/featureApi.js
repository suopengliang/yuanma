var models = require('../db');
var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var $sql = require('../sqlMap');

// 连接数据库
var conn = mysql.createConnection(models.mysql);

conn.connect();
var jsonWrite = function(res, ret) {
  if(typeof ret === 'undefined') {
    res.json({
      code: '1',
      msg: '操作失败'
    });
  } else {
    res.json(ret);
  }
};

// 增加用户接口
router.post('/icons', (req, res) => {
  console.log(req);
  var sql = $sql.feature.icons;
  var params = req.body;
  conn.query(sql, [params.iconname], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/hot', (req, res) => {
  console.log(req);
  var sql = $sql.feature.hot;
  var params = req.body;
  conn.query(sql, [params.hotname], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/favorite', (req, res) => {
  var sql = $sql.feature.favorite;
  var params = req.body;
  conn.query(sql, [params.likename], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/intro', (req, res) => {
  var sql = $sql.intro.alldata;
  var params = req.body;
  conn.query(sql, [params.name], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/updatecomment', (req, res) => {
  var sql = $sql.comment.update;
  var params = req.body;
  conn.query(sql, [params.upcomment,params.upscenname], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/addorder', (req, res) => {
  var sql = $sql.add.order;
  var params = req.body;
  conn.query(sql, [params.nicks,params.username,params.phonenum,params.date,params.num,params.prices,params.scenname,params.ispay,params.isuse,params.favs], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/findorder', (req, res) => {
  var sql = $sql.find.order;
  var params = req.body;
  conn.query(sql, [params.nicks], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/updateorder', (req, res) => {
  var sql = $sql.update.order;
  var params = req.body;
  conn.query(sql, [params.ids], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/deleteorder', (req, res) => {
  var sql = $sql.delete.order;
  var params = req.body;
  conn.query(sql, [params.ids], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/updateuseorder', (req, res) => {
  var sql = $sql.updateuse.order;
  var params = req.body;
  conn.query(sql, [params.ids], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/updatefavs', (req, res) => {
  var sql = $sql.updatefavs.order;
  var params = req.body;
  conn.query(sql, [params.favs,params.ids], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
router.post('/findindsorder', (req, res) => {
  var sql = $sql.findids.order;
  var params = req.body;
  conn.query(sql, [params.ids], function(err, result) {
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  })
});
module.exports = router;
