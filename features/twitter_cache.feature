Feature: Twitter Cache
  In order to never have an empty Twitter widget
  I want to cache the RubyBayou Twitter feed

  Scenario: Twitter is alive
    Given Twitter is alive
    When I go to the home page
    Then I should see "Follow RubyBayou on Twitter"
    
  Scenario: Twitter is not alive
    Given Twitter is not alive
    When I go to the home page
    Then I should not see "Follow RubyBayou on Twitter"