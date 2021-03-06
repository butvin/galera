const tailwind = require('tailwindcss')
// const postCssUrl = require('postcss-url')
const postCssImport = require('postcss-import')
const postCssAutoReset = require('postcss-autoreset')

module.exports = {
    plugins: [
        postCssAutoReset(),
        require('postcss-import'),
        tailwind('./tailwind.config.js'),
        require('postcss-100vh-fix'),
        require('autoprefixer'),
        postCssImport,
        // postCssUrl({ url: 'copy', useHash: true }),
    ]
};