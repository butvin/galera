const path = require('path')
const debug = require('debug')
const Encore = require('@symfony/webpack-encore')

// const PurgeCssPlugin = require('purgecss-webpack-plugin');
// const glob = require('glob-all');
// const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev');
}

Encore
    .setOutputPath('public/build/') // directory where compiled assets will be stored
    .setPublicPath('/build') // public path used by the web server to access the output path
    .setManifestKeyPrefix('build/') // only needed for CDN's or sub-directory deploy
    .addEntry('app', './assets/app.js')
    .addStyleEntry('main', './assets/styles/main.css')
    .addStyleEntry('tailwind', './assets/styles/tailwind.css')
    // .enableStimulusBridge('./assets/controllers.json') // enables the Symfony UX Stimulus bridge (used in assets/bootstrap.js)
    .splitEntryChunks() // When enabled, Webpack "splits" your files into smaller pieces for greater optimization.
    .enableSingleRuntimeChunk()  // will require an extra script tag for runtime.js but, you probably want this, unless you're building a single-page app
    // https://symfony.com/doc/current/frontend.html#adding-more-features
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    .enableVersioning(Encore.isProduction())  // enables hashed filenames (e.g. app.abc123.css)
    .enableIntegrityHashes(Encore.isProduction())
    .copyFiles({
        from: './assets/images/static',
        to: 'images/static/[name].[hash:4].[ext]'
    })
    .copyFiles({
        from: './assets/root',
        to: '../[name].[ext]'
    })
    .configureBabel((config) => {
        config.plugins.push('@babel/plugin-proposal-class-properties');
    })
    .configureBabelPresetEnv((config) => {
        config.useBuiltIns = 'usage';
        config.corejs = 3;
    })
    .enableSassLoader((options) => {
        options.config = {
            path: './postcss.config.js' // directory where the postcss.config.js file is stored
        };
    })
    .enablePostCssLoader(
// (options) => {
//     options.postCssLoaderOptionsCallback = {
//         config: path.resolve('./postcss.config.js'),
//     };
// }
    )
    //.enableTypeScriptLoader() // uncomment if you use TypeScript
    //.enableReactPreset() // uncomment if you use React
    .autoProvidejQuery() // uncomment if you're having problems with a jQuery plugin
;
// Using Encore.configureLoaderRule()
// Encore.configureLoaderRule('stylus', loaderRule => {
//     loaderRule.test = /\.(jsx?|vue)$/
// });
module.exports = Encore.getWebpackConfig();
// const manifestOpt = {};
// module.exports = {
//     entry: ['app.js'],
//     plugins: [new WebpackManifestPlugin(manifestOpt)]
// };
