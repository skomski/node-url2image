# node-url2png

[![Build Status](https://secure.travis-ci.org/Skomski/node-url2png.png?branch=master)](http://travis-ci.org/Skomski/node-url2png)

Convert websites into images

## Dependencies

```
wkhtmltoimage
http://code.google.com/p/wkhtmltopdf/downloads/list
````

## Install

```
npm install url2png
```

## Usage

```javascript
var Converter = require('url2png');

var converter = new Converter({
  width: 200,
  height: 200,
  format: 'png'
});

converter.process('http://teamliquid.net', __dirname + '/t.png', function(err) {
  if (err) throw err;
});
```

## License

Licensed under the MIT license.
