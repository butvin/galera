const Encore = require('@symfony/webpack-encore');
// Manually configure the runtime environment if not already configured yet by the "encore" command.
// It's useful when you use tools that rely on webpack.config.js file.
if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev');
}

const path = require('path');

Encore
    .setOutputPath('public/build/') // directory where compiled assets will be stored
    .setPublicPath('/build') // public path used by the web server to access the output path
    // .setManifestKeyPrefix('build/') // only needed for CDN's or sub-directory deploy
    /*
     * ENTRY CONFIG
     *
     * Each entry will result in one JavaScript file (e.g. app.js)
     * and one CSS file (e.g. app.css) if your JavaScript imports CSS.
     */
    .addEntry('app', './assets/app.js')
    .addStyleEntry('styles', './assets/styles/app.scss')
    // enables the Symfony UX Stimulus bridge (used in assets/bootstrap.js)
    // .enableStimulusBridge('./assets/controllers.json')
    // .copyFiles({
    //     from: './assets/root/',
        //     to: 'images/[path][name].[hash:8].[ext]'
        // to: './.',
        // if versioning is enabled, add the file hash too
        //to: 'images/[path][name].[hash:8].[ext]',
        // only copy files matching this pattern
        // pattern: /\.(png|svg|xml|json)$/
    // })

    // When enabled, Webpack "splits" your files into smaller pieces for greater optimization.
    .splitEntryChunks()

    // will require an extra script tag for runtime.js
    // but, you probably want this, unless you're building a single-page app
    .enableSingleRuntimeChunk()

    /*
     * FEATURE CONFIG
     * https://symfony.com/doc/current/frontend.html#adding-more-features
     */
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    // .enableVersioning(Encore.isProduction())  // enables hashed filenames (e.g. app.abc123.css)

    .configureBabel((config) => {
        config.plugins.push('@babel/plugin-proposal-class-properties');
    })

    // enables @babel/preset-env polyfills
    .configureBabelPresetEnv((config) => {
        config.useBuiltIns = 'usage';
        config.corejs = 3;
    })
    .enableSassLoader()

    // uncomment if you use TypeScript
    //.enableTypeScriptLoader()

    // uncomment if you use React
    //.enableReactPreset()

    // uncomment to get integrity="..." attributes on your script & link tags
    // requires WebpackEncoreBundle 1.4 or higher
    .enableIntegrityHashes(Encore.isProduction())

    // uncomment if you're having problems with a jQuery plugin
    //.autoProvidejQuery()
;

// Using Encore.configureLoaderRule()
// Encore.configureLoaderRule('stylus', loaderRule => {
//     loaderRule.test = /\.(jsx?|vue)$/
// });

module.exports = Encore.getWebpackConfig();

// const { WebpackManifestPlugin } = require('webpack-manifest-plugin');
// const manifestOpt = {};
//
// module.exports = {
//     entry: ['app.js'],
//     plugins: [new WebpackManifestPlugin(manifestOpt)]
// };
