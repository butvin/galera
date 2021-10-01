const Encore = require('@symfony/webpack-encore')

if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev');
}

const path = require('path')
const debug = require('debug')
const glob = require('glob-all')

const { WebpackManifestPlugin } = require('webpack-manifest-plugin')
const MiniCssExtractPlugin = require("mini-css-extract-plugin")
const PurgeCssPlugin = require('purgecss-webpack-plugin')

const PATHS = {
    src: path.join(__dirname, 'public/build/')
};

// https://symfony.com/doc/current/frontend.html#adding-more-features
Encore.setOutputPath('public/build/') // directory where compiled assets will be stored
    .setPublicPath('/build') // public path used by the web server to access the output path
    .setManifestKeyPrefix('build/') // only needed for CDN's or sub-directory deploy
    .addEntry('app', './assets/app.js')
    .addStyleEntry('main', './assets/styles/main.scss')
    // .addStyleEntry('tailwind', './assets/styles/tailwind.css')
    // .enableStimulusBridge('./assets/controllers.json') // enables the Symfony UX Stimulus bridge (used in assets/bootstrap.js)
    .splitEntryChunks() // When enabled, Webpack "splits" your files into smaller pieces for greater optimization.
    .enableSingleRuntimeChunk()  // will require an extra script tag for runtime.js but, you probably want this, unless you're building a single-page app
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    .enableVersioning(Encore.isProduction())
    .enableIntegrityHashes(Encore.isProduction())

    .copyFiles({
        from: './assets/images/static',
        to: 'images/static/[name].[ext]'
    })

    .copyFiles({
        from: './assets/images/',
        to: 'images/[name].[ext]v=[hash:12]'
    })

    .copyFiles({
        from: './assets/root/',
        to: '../[name].[ext]'
    })

    .configureBabel((config) => {
        config.plugins.push('@babel/plugin-proposal-class-properties');
    })
    .configureBabelPresetEnv((config) => {
        config.useBuiltIns = 'usage';
        config.corejs = 3;
    })
    .enableSassLoader()
    .enablePostCssLoader()
    //.enableTypeScriptLoader() // uncomment if you use TypeScript
    //.enableReactPreset() // uncomment if you use React
    // .autoProvidejQuery() // uncomment if you're having problems with a jQuery plugin
;

//##Using Encore.configureLoaderRule()
// Encore.configureLoaderRule('stylus', loaderRule => {
//     loaderRule.test = /\.(jsx?|vue)$/
// });
module.exports = Encore.getWebpackConfig();

module.exports = {
    plugins: [
        new MiniCssExtractPlugin(),
    ],
    module: {
        rules: [{
            test: /\.css$/i,
            use: [
                MiniCssExtractPlugin.loader,
                "css-loader",
            ],
        }],
    },
};

// module.exports = {
//     entry: './assets/app.js',
//     output: {
//         filename: 'app.js',
//         path: path.join(__dirname, 'public/build/')
//     },
//     optimization: {
//         splitChunks: {
//             cacheGroups: {
//                 styles: {
//                     name: 'styles',
//                     test: /\.css$/,
//                     chunks: 'all',
//                     enforce: true
//                 }
//             }
//         }
//     },
//     module: {
//         rules: [{
//             test: /\.css$/,
//             use: [
//                 MiniCssExtractPlugin.loader,
//                 "css-loader"
//             ]
//         }]
//     },
//     plugins: [
//         new MiniCssExtractPlugin({
//             filename: "[name][min].css",
//         }),
//         new PurgeCssPlugin({
//             paths: glob.sync(
//                 `${PATHS.src}/**/ * `,
//                 { nodir: true }
//             ),
//         }),
//     ]
// };
