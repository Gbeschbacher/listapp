"use strict"

gulp = require 'gulp'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
concat = require 'gulp-concat'
del = require 'del'
livereload = require 'gulp-livereload'
nodemon = require 'gulp-nodemon'

livereload
    start: true

_ref = [
    "",
    "",
    "   _                                ",
    " \\_|_)  o                            ",
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

coffeeSourceClient = [
    './client/javascripts/app.coffee',
    './client/javascripts/**/*.coffee'
]

jadeSourceClient = [
    './client/views/**/*.jade'
]

coffeeSourceServer = [
    './server/**/*.coffee'
]

gulp.task 'build', ["build:coffee"]

gulp.task 'watch', ["watch:coffee", "watch:jade"]


gulp.task 'build:coffee', ->
    gulp.src( coffeeSourceClient )
    .pipe( concat ( 'build.coffee' ) )
    .pipe( gulp.dest( './client/statics/build/js' ) )
    .pipe( coffee({bare: true}).on( 'error', gutil.log ) )
    .pipe( gulp.dest( './client/statics/build/js' ) )
    .pipe( livereload() )

gulp.task 'clean:build-coffee', ['build:coffee'], ->
    del( './client/statics/build/js/build.coffee')

gulp.task 'watch:coffee', ->
    gulp.watch coffeeSourceClient, ['clean:build-coffee'], (file) ->
        console.log "js changed"
        console.log(file)

gulp.task 'watch:jade', ->
    gulp.watch jadeSourceClient, ->
        console.log "view  changed"
        livereload.reload()

gulp.task 'dev', ["nodemon", "watch"], ->

nodemonStarted = false

gulp.task "nodemon", ["build"], ->
    if nodemonStarted
        return true

    nodemonStarted = true

    nodemon(
        script: "./app.js"
        watch: "./server"
        env: "NODE_ENV": "development")
    .on "restart", ->
            console.log "app changed"