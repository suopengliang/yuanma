// const userApi = require('./api/userApi');
const checkApi = require('./api/checkApi');
const featureApi = require('./api/featureApi');
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const express = require('express');
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));//中间件解析parser   extended/扩展模式 limit/限制

// 后端api路由
// app.use('/api/user', userApi);
app.use('/api/checkuser', checkApi);
app.use('/api/foundicon', featureApi);

// 监听端口
app.listen(3000);
console.log('success listen at port:3000......');
