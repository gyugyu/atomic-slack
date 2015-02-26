var app = require('app');
var BrowserWindow = require('browser-window');

var mainWindow = null;

app.on('ready', function() {
  mainWindow = new BrowserWindow({width: 600, height: 800});
  mainWindow.loadUrl('file://' + __dirname + '/index.html');
  mainWindow.on('closed', function() {
    mainWindow = null;
  });
});


