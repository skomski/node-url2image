Assert        = require 'assert'
Converter     = require '..'
Fs            = require 'fs'

testFinished = false

converter = new Converter
  height : 200
  width  : 200
  format : 'png'

converter.process 'http://teamliquid.net', __dirname + '/t.png', (err) ->
  Assert.ifError err

  file = Fs.readFileSync __dirname + '/t.png'
  Assert.ok file.length > 0
  testFinished = true

process.on 'exit', () ->
  Assert.ok testFinished
