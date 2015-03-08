"use strict";

http = require "http"

express = require "express"
morgan = require "morgan"
bodyParser = require "body-parser"
# passport = require "passport"

config = require "./config"
api = require "./api"

app = express()

app.set "views", __dirname + "/../client/views/"
app.set "view engine", "jade"

app.use morgan("combined")
app.use bodyParser.urlencoded(extended: true)
app.use bodyParser.json()

# serve build files
app.use express.static('./client/build')
app.use express.static('./client/build/js')

# bind api
app.use api

server = http.createServer(app)

module.exports =
    server: server
    start: ->
        server.listen config.port, ->
            address = server.address()
            console.log 'Listening on ' + address.address + ':' + address.port
