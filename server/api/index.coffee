"use strict";

router = require("express").Router();

users = require "./users"

# router.use("/test/v0/user", user)

###
router.all "*", (req, res) ->
    console.log "Route not found: ", req.url
    res.render "index"
###

module.exports = router
