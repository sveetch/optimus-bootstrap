const Path = require("path");
const webpack = require('webpack');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const BundleTracker = require('webpack-bundle-tracker');
const RemoveEmptyScriptsPlugin = require('webpack-remove-empty-scripts');

module.exports = {
    // Disable production-specific optimizations by default
    // They can be re-enabled by running the cli with `--mode=production` or making a
    // separate webpack config for production.
    mode: "development",

    // Every source path are resolved from current directory
    context: __dirname,

    // Entrypoint sources to build, every Javascript or Sass entrypoints have to be
    // defined as its own entry
    entry: {
        main: "./js/main.js",
        layout: "./scss/layout.scss",
    },

    // Built JS files goes into project staticfile directory
    output: {
        path: Path.resolve("../project/sources/builds"),
        // filename: "js/[name].[contenthash:6].js",
        filename: "js/[name].js",
        publicPath: "/static/builds/js/",
        // Ensure previous bundle builds are cleaned and do not stack forever
        clean: true,
    },

    // Modules rules
    module: {
        rules: [
            // Babel ES6 inspection watch for every JS sources changes
            {
                test: /\.js$/,
                include: Path.resolve(__dirname, 'js'),
                use: {
                    loader: "babel-loader",
                    options: {
                        presets: ["@babel/preset-env"]
                    },
                }
            },
            // Rule to process Sass compilation through related loaders
            {
                test: /\.scss$/,
                include: Path.resolve(__dirname, 'scss'),
                use: [
                    {
                        loader: MiniCssExtractPlugin.loader,
                        options: {},
                    },
                    {
                        loader: "css-loader",
                        options: {
                            // We do not want to resolve CSS url() relatively to the
                            // frontend sources
                            "url": false,
                            // Enable source map (seems broken because of our CSS build
                            // pipeline)
                            "sourceMap": true,
                        },
                    },
                    "sass-loader",
                ]
            }
        ]
    },

    // Enabled webpack plugins with their config
    plugins: [
        // Create/update manifest of built entries
        new BundleTracker({
            path: Path.join(__dirname, '../project/sources/builds'),
            filename: 'frontend-assets.json'
        }),
        // Remove empty script generated from Sass entries compilation
        new RemoveEmptyScriptsPlugin(),
        // Take in charge compiled CSS
        new MiniCssExtractPlugin({
            // filename: "css/[name].[contenthash:6].css",
            // chunkFilename: "css/[id].[contenthash:6].css",
            filename: "css/[name].css",
            chunkFilename: "css/[id].css",
        }),
    ],
};
