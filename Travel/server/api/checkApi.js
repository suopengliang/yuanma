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
router.post('/fontUser',(req,res) =>{
  var sql = $sql.user.fontuser;
  var params = req.body;//容纳post数据
  conn.query(sql,[params.username],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/insertUser',(req,res) =>{
  var sql = $sql.user.insertuser;
  var params = req.body;//容纳post数据
  conn.query(sql,[params.username,params.password,params.email,params.fav],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/updatepassword',(req,res) =>{
  var sql = $sql.user.updatepassword;
  var params = req.body;//容纳post数据
  conn.query(sql,[params.password,params.username],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/updateemail',(req,res) =>{
  var sql = $sql.user.updateemail;
  var params = req.body;//容纳post数据
  conn.query(sql,[params.emails,params.username],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/deletelogin',(req,res) =>{
  var sql = $sql.user.delete
  var params = req.body;//容纳post数据
  conn.query(sql,[params.username],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/deleteorder',(req,res) =>{
  var sql = $sql.user.deleteorder
  var params = req.body;//容纳post数据
  conn.query(sql,[params.username],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/updateusername',(req,res) =>{
  var sql = $sql.user.updateusername;
  var params = req.body;//容纳post数据
  conn.query(sql,[params.newname,params.username],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/updatefav',(req,res) =>{
  var sql = $sql.user.addfav;
  var params = req.body;//容纳post数据
  conn.query(sql,[params.fav,params.username],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/updatenicks',(req,res) =>{
  var sql = $sql.user.updatenicks;
  var params = req.body;//容纳post数据
  conn.query(sql,[params.newname,params.username],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})
router.post('/seekall',(req,res) =>{
  var sql = $sql.user.all;
  var params = req.body;//容纳post数据
  conn.query(sql,[],function(err,result){
    if (err) {
      console.log(err);
    }
    if (result) {
      jsonWrite(res, result);
    }
  });
})


// router.post('/foundpassword',(req,res) =>{
//   var sql = $sql.user.founduser;
//   var params = req.body;//容纳post数据
//   conn.query(sql,[params.username,params.email],function(err,result){
//     if (err) {
//       console.log(err);
//     }
//     if (result) {
//       jsonWrite(res, result);
//     }
//   });
// })
module.exports = router;
