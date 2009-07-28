Feature: Twitter Cache
  In order to never have an empty Twitter widget
  I want to cache the RubyBayou Twitter feed

  Scenario: Twitter is alive
    Given I am at the home page
    When Twitter is alive
    Then I should see the RubyBayou Twitter feed
  
  Scenario: Twitter is not alive
    Given I am at the home page
    When Twitter is not alive
    Then I should see the RubyBayou Twitter feed