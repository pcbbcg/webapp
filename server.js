var express = require('express');

var app = express();

var server= require('http').Server(app);

var db = require('./config/database');

app.use('/', express.static(__dirname + '/public'));

server.listen(3000);
