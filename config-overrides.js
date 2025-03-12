const webpack = require('webpack');

module.exports = function override(config, env) {
  // Disable ESM strict mode
  config.module.rules.push({
    test: /\.m?js/,
    resolve: {
      fullySpecified: false
    }
  });

  // Add fallbacks for Node.js core modules
  config.resolve.fallback = {
    ...config.resolve.fallback,
    crypto: require.resolve('crypto-browserify'),
    stream: require.resolve('stream-browserify'),
    assert: require.resolve('assert'),
    http: require.resolve('stream-http'),
    https: require.resolve('https-browserify'),
    os: require.resolve('os-browserify/browser'),
    url: require.resolve('url'),
    path: require.resolve('path-browserify'),
    fs: false,
    util: require.resolve('util'),
    buffer: require.resolve('buffer'),
    zlib: require.resolve('browserify-zlib'),
    vm: require.resolve('vm-browserify'),
  };

  // Add plugins to provide global variables
  config.plugins.push(
    new webpack.ProvidePlugin({
      process: require.resolve('process/browser'),
      Buffer: ['buffer', 'Buffer'],
    })
  );

  // Add alias for process/browser
  config.resolve.alias = {
    ...config.resolve.alias,
    'process/browser': require.resolve('process/browser'),
  };

  return config;
}; 