"use strict";

router = require("express").Router();

users = require "./users"
defaults = require "./defaults"

router.get "/", defaults.index
router.get "/partials/:name", defaults.partials
router.get "/partials/:directory/:name", defaults.subPartials

# router.all "*", (req, res) ->
#     console.log "Route not found: ", req.url
#     res.render "index"

module.exports = router
