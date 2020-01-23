gulp-rev-suffix
---
> gulp plugin for cache-busting files using query string file hash

[![Build Status](https://travis-ci.org/duanjianbo/gulp-rev-suffix.svg?branch=master)](https://travis-ci.org/duanjianbo/gulp-rev-suffix)

installation
---
```
$ npm install gulp-rev-suffix --save-dev
```

how?
---
_gulpfile.js_
```
var rev = require('gulp-rev-suffix');
//default
gulp.task('rev', function() {
  gulp.src('./index.html')
    .pipe(rev())
    .pipe(gulp.dest('.'));
});
//custom
gulp.task('rev', function() {
  gulp.src('./index.html')
    //rev(options) options:the array contains multiple custom rev-types
    .pipe(rev([{type:'timestamp',value:()=>{return Date.now();}},{type:'version',value:()=>{return '1.6.0'}}]))
    .pipe(gulp.dest('.'));
});

```

_terminal_
```
$ gulp rev
```

what?
---
The [gulp-rev-suffix](https://github.com/duanjianbo/gulp-rev-suffix) plugins allows for appending a query-string file hash to dependencies declared in html files defined using the following regex: `(?:href|src)="(.*)[\?]rev=(.*)[\"]`

That's fancy talk for any stylesheet or script declarations that are declared in an html file such as the following:

```
<!doctype html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="style/style-one.css?rev=@@hash">
    <script src="script/script-one.js?rev=@@hash"></script>
    <script src="script/script-two.js"></script>
  </head>
  <body>
    <div><p>hello, world!</p></div>
    <script src="script/script-three.js?rev=@@hash"></script>
    <script src="script/script-version.js?rev=@@version"></script>
    <script src="script/script-timestamp.js?rev=@@timestamp"></script>
    <script src="script/script-custom.js?rev=@@any-custom-type"></script>
  </body>
</html>
```

will turn into something similar as the following after running `gulp-rev-suffix`:
```
<!doctype html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="style/style-one.css?rev=d65aaba987e9c1eefeb4be9cfd34e0de">
    <script src="script/script-one.js?rev=17a5da6c8a2d875cf48aefb722eefa07"></script>
    <script src="script/script-two.js"></script>
  </head>
  <body>
    <div><p>hello, world!</p></div>
    <script src="script/script-three.js?rev=5cadf43edba6a97980d42331f9fffd17"></script>
    <script src="script/script-version.js?rev=1.6.0"></script>
    <script src="script/script-timestamp.js?rev=1579422890214"></script>
    <script src="script/script-custom.js?rev=custom-type-value"></script>
  </body>
</html>
```
rev=@@hash,default rev-type

why?
---
In order to meet the project requirements of the company,forked from [bustardcelly/gulp-rev-append](https://github.com/bustardcelly/gulp-rev-append) and modify it to support custom rev-value.

Tests
---

```
$ npm run test
```

License
---
Copyright (c) 2020 duanjianbo

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
