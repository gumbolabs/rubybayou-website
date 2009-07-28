Feature: Twitter Cache
  In order to never have an empty Twitter widget
  I want to cache the RubyBayou Twitter feed

  Scenario: Twitter is alive
    Given Twitter is alive
    When I am go to the home page
    Then I should see the RubyBayou Twitter feed
  
  Scenario: Twitter is not alive
    Given Twitter is not alive
    When I am go to the home page
    Then I should see the RubyBayou Twitter feed