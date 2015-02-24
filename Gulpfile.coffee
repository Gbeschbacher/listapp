"use strict"

gulp = require 'gulp'

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