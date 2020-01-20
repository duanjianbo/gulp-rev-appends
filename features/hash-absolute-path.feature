Feature: Use gulp-rev-suffix to modify absolute dependency declaration in html file
  As a user of gulp-rev-suffix
  I want to append a revision hash to absolute dependencies declared in an html file
  So that non-cached versions of the files are loaded

  Scenario: Hash is appended to absolute file dependency inline
    Given I have declared absolute dependencies in an html file with revision tokens
    When I invoke the gulp-rev-suffix plugin
    Then The dependencies are appended with a hash inline
