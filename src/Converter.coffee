{ spawn } = require 'child_process'

class Converter
  module.exports = Converter

  constructor: ({
      @height,
      @width,
      @format,
      @images,
      @quality,
      @delay,
      @javascript,
      @fileAccess
    } = {}) ->

      @images     ?= true
      @javascript ?= true
      @fileAccess ?= true

  _generateArguments: (input, output) ->
    args = []

    if @width?
      args.push "--width"
      args.push @width
      args.push "--disable-smart-width"

    if @height?
      args.push '--height'
      args.push @height

    if @format?
      args.push '--format'
      args.push @format

    if @images == false
      args.push '--no-images'

    if @javascript == false
      args.push '--disable-javascript'

    if @quality?
      args.push '--quality'
      args.push @quality

    if @delay?
      args.push '--javascript-delay'
      args.push @delay

    if @fileAccess == false
      args.push '--disable-local-file-access'

    args.push input
    args.push output

    return args

  process: (input, output, cb) ->
    process = spawn 'wkhtmltoimage', @_generateArguments(input, output)
    process.on 'exit', (code) ->
      if code != 0
        return cb new Error('WkhtmlToImage: ' + code)

      cb null
