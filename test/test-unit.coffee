Assert        = require 'assert'
Converter     = require '..'
test          = require 'utest'

test 'Converter'
  '#constructor': () ->
    converter = new Converter
      height : 200
      width  : 200
      format : 'png'

    Assert.equal converter.height, 200
    Assert.equal converter.width , 200
    Assert.equal converter.format, 'png'

  '#_generateArguments': () ->
    converter = new Converter

    args = converter._generateArguments 'teamliquid.net', '/mnt/tmp/t.jpg'

    Assert.deepEqual args, ['teamliquid.net', '/mnt/tmp/t.jpg']
