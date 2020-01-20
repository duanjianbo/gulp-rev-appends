Feature: Use gulp-rev-suffix to modify dependency declaration in html file
  As a user of gulp-rev-suffix
  I want to append a revision hash to dependencies declared in an html file
  So that non-cached versions of the files are loaded

  Scenario: Hash is appended to file dependency inline
    Given I have declared a dependency in an html file with revision tokens
    When I invoke the gulp-rev-suffix plugin
    Then The dependency is appended with a hash inline

  Scenario: Hashes are appended to file dependency inline
    Given I have declared dependencies in an html file with revision tokens
    When I invoke the gulp-rev-suffix plugin
    Then The dependencies are appended with a hash inline

  Scenario: Has does not remove attributes of element following the 'rev' declaration
    Given I have declared an image dependency in an html file with revision tokens
    When I invoke the gulp-rev-suffix plugin
    Then The attributes following the revision tokens are preserved
