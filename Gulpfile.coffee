"use strict"

gulp = require 'gulp'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
concat = require 'gulp-concat'


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


gulp.task 'default', ->
    console.log('Default task called')

coffeeSource = [
    './client/javascripts/app.coffee',
    './client/javascripts/**/*.coffee'
]

gulp.task 'coffee', ->
    gulp.src( coffeeSource )
    .pipe( concat ( 'build.coffee' ) )
    .pipe( gulp.dest( './client/build/js' ) )
    .pipe( coffee({bare: true}).on( 'error', gutil.log ) )
    .pipe( gulp.dest( './client/build/js' ) )
