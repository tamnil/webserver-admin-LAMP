#!/bin/bash

#instalacao grunt

# inicia npm
npm init
# instala o ambiente de desenvolvimento

npm install grunt grunt-contrib-connect grunt-contrib-concat grunt-contrib-uglify grunt-contrib-watch  --save-dev

# create grunt file (gruntfile.js):
cat << EOF > gruntfile.js
module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        watch: {
            options: { livereload: true, },
            css: { files: ['css/**/*.css'], },
            js: { files: ['js/**/*.js'], },
            html: { files: ['*.html'], },
            phtml: { files: ['*.phtml'], },
            php: { files: ['*.php'], }
        },
        connect: {
            server: {
                options: {
                    port: 9000,
                    base: '.',
                    hostname: 'localhost',
                    protocol: 'http',
                    livereload: true,
                    open: true,
                }
            }
        },
    });
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.registerTask('server', ['connect','watch']);

};

EOF

