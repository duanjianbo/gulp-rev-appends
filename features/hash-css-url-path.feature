Feature: Use gulp-rev-suffix to modify css url() dependency declaration in html file
  As a user of gulp-rev-suffix
  I want to append a revision hash to css dependencies declared in an html file with url()
  So that non-cached versions of the files are loaded

  Scenario: Hash is appended to file dependency defined with css url()
    Given I have declared dependencies in an html file using css url() with revision tokens
    When I invoke the gulp-rev-suffix plugin
    Then The dependencies are appended with a suffix inline

    Scenario: Hash is appended to file dependency defined with css background url()
    Given I have declared dependencies in an html file using css background url() with revision tokens
    When I invoke the gulp-rev-suffix plugin
    Then The dependencies are appended with a suffix inline
