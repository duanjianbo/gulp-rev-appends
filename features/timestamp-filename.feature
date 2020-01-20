Feature: Use gulp-rev-suffix to modify dependency declaration in html file
  As a user of gulp-rev-suffix
  I want to append a revision timestamp to dependencies declared in an html file
  So that non-cached versions of the files are loaded

  Scenario: timestamp is appended to file dependency inline
    Given I have declared a dependency in an html file with '@@timestamp' tokens
    When I invoke the gulp-rev-suffix plugin
    Then The dependency is appended with a timestamp inline

