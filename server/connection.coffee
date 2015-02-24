"use strict";

mongoose = require "mongoose"
config = require "./config"

connection = null

connect = ->
    connection = mongoose.createConnection(config.mongo, server: socketOptions: keppAlive: 1)

connect()

connection.on 'error', (error) ->
    console.log 'error while creating db connection', error

# automatically reconnect
connection.on 'disconnected', ->
    console.log 'disconnected from server, trying to reconnect'
    connect()

connection.on 'open', ->
    console.log 'db connection opened'

module.exports = connection
