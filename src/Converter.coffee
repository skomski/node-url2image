{ spawn } = require 'child_process'

class Converter
  module.exports = Converter

  constructor: ({ @height, @width, @format } = {}) ->

  _generateArguments: (url, path) ->
    args = []

    if @width?
      args.push "--width"
      args.push "#{@width}"
      args.push "--disable-smart-width"

    if @height?
      args.push '--height'
      args.push "#{@height}"

    if @format?
      args.push '--format'
      args.push "#{@format}"

    args.push url
    args.push path

    return args

  process: (url, path, cb) ->
    process = spawn 'wkhtmltoimage', @_generateArguments(url, path)
    process.on 'exit', (code) ->
      if code != 0
        return cb new Error('wkhtmltoimage.exitCode: ' + code)

      cb null
