process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

const webpack = require('webpack')

environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        jQuery: 'jquery/dist/jquery',
        Popper: 'popper.js/dist/popper'
    })
)

module.exports = environment.toWebpackConfig()
