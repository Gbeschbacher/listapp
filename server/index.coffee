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

# serve statics
app.use express.static(__dirname + '/../client/statics/')

#serve css files
app.use express.static(__dirname + '/../client/stylesheets')

# bind api
app.use api

server = http.createServer(app)

module.exports =
    server: server
    start: ->
        server.listen config.port, ->
            address = server.address()
            console.log 'Listening on ' + address.address + ':' + address.port
