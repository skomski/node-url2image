# node-url2image

[![Build Status](https://secure.travis-ci.org/Skomski/node-url2image.png?branch=master)](http://travis-ci.org/Skomski/node-url2image)

Convert websites into images

## Dependencies

```
wkhtmltoimage
http://code.google.com/p/wkhtmltopdf/downloads/list
````

## Install

```
npm install url2image
```

## Usage

```javascript
var Converter = require('url2image');

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
