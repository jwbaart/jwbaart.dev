const express = require('express');
const app = express();
const path = require('path');

// viewed at http://localhost:80
app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/dist/index.html'));
});

app.listen(8080);