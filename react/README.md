# React

## Step 1: Install NPM packages

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

## Step 2: Build the React app

Run `webpack` and you will see the `build` folder.

This is the output:

```
➜  reacttest  webpack
Hash: 37ed70cffe7dda96832e
Version: webpack 1.12.10
Time: 2869ms
    Asset    Size  Chunks             Chunk Names
bundle.js  676 kB       0  [emitted]  main
    + 159 hidden modules
```

## Step 3: View Sample Page

Open `helloworld.html` in your browser (via a web server) and you will see the React page.