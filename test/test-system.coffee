Assert        = require 'assert'
Converter     = require '..'
Fs            = require 'fs'

testFinished = false

converter = new Converter
  height : 50
  format : 'png'

converter.process __dirname + '/fixture/example.html', __dirname + '/result/test.png', (err) ->
  Assert.ifError err

  fixture = Fs.readFileSync __dirname + '/result/test.png'
  file    = Fs.readFileSync __dirname + '/fixture/example.png'

  Assert.equal fixture.length, file.length
  testFinished = true

process.on 'exit', () ->
  Assert.ok testFinished
