require('coffee-script/register');
var App = require('./src/app');
var $ = require('react');

$.render(
  $.createElement(App),
  document.getElementById('react')
);
