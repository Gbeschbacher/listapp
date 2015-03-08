"use strict"

gulp = require 'gulp'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
concat = require 'gulp-concat'
del = require 'del'


_ref = [
    "",
    "",
    "   _                                ",
    "\\_|_)  o                            ",
    "   |        , _|_     __,    _    _  ",
    "  _|    |  / \\_|-----/  |  |/ \\_|/ \\_",
    " (/\\___/|_/ \\/ |_/   \\_/|_/|__/ |__/ ",
    "                          /|   /|    ",
    "                          \\|   \\| ",
    "",
    ""
]

for i in [0..._ref.length]
    console.log _ref[i]


gulp.task 'default', ['clean:build-coffee'], ->
    console.log('builds and cleans')

coffeeSource = [
    './client/javascripts/app.coffee',
    './client/javascripts/**/*.coffee'
]

gulp.task 'build:coffee', ->
    gulp.src( coffeeSource )
    .pipe( concat ( 'build.coffee' ) )
    .pipe( gulp.dest( './client/statics/build/js' ) )
    .pipe( coffee({bare: true}).on( 'error', gutil.log ) )
    .pipe( gulp.dest( './client/statics/build/js' ) )

gulp.task 'clean:build-coffee', ['build:coffee'], ->
    del( './client/statics/build/js/build.coffee')
