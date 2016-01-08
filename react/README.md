# React

NPM installation script to make it work on Webpack.

```
npm install --save react react-dom babel-core babel-loader babel-preset-react webpack
```

And the `webpack.config.js` file:

```javascript
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
```
