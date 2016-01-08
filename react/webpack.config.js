var path = require('path');
var config = {
   entry: path.resolve(__dirname, 'main.js'),
   output: {
       path: path.resolve(__dirname, 'build'),
       filename: 'bundle.js'
   },
   module: {
       loaders: [{
           test: /\.js?$/,
           loader: 'babel',
           query: {
              presets: ['react']
           }
       }]
   },

};

module.exports = config;
