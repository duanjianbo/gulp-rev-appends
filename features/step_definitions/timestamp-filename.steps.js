var chai = require('chai');
var expect = chai.expect;
var cheerio = require('cheerio');
var File = require('gulp-util').File;
var Buffer = require('buffer').Buffer;

module.exports = function() {
  'use strict';

  var result;

  this.World = require('../support/world').World;

  this.Given(/^I have declared a dependency in an html file with '@@timestamp' tokens$/, function (callback) {
    this.indexFile = new File({
      cwd: 'test/fixtures/',
      base: 'test/fixtures/static',
      path: 'test/fixtures/static/timestamp-index.html',
      contents: new Buffer(this.htmlFileContents('index'))
    });
    callback();
  });

  this.When(/^invoke the gulp\-rev\-suffix plugin$/, function (callback) {
    var revver = this.plugin();
    revver.on('data', function(data) {
      result = data.contents.toString();
      callback();
    });
    revver.write(this.indexFile);
  });

  this.Then(/^The dependency is appended with a timestamp inline$/, function (callback) {
    var fileDeclarationRegex = this.FILE_DECL;
    var declarations = result.match(fileDeclarationRegex);
    // defined in test/fixtures/static/index.html
    expect(declarations.length).to.equal(3);
    for(var i = 0; i < declarations.length; i++) {
      // plugin should change @@hash to timestamp based on file contents
      expect(fileDeclarationRegex.exec(declarations[i])[2]).to.not.equal('@@timestamp');
      fileDeclarationRegex.lastIndex = 0;
    }
    callback();
  });

};
