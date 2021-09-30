const tailwind = require('tailwindcss');

module.exports = {
    plugins: [
        require('postcss-import'),
        tailwind('./tailwind.config.js'),
        require('postcss-100vh-fix'),
        require('tailwindcss'),
        // require('postcss-autoreset')(),
        require('autoprefixer'),
        require('postcss-import'),
        require('postcss-url')({
            url: 'copy',
            useHash: true
        }),
    ]
};