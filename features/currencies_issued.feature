Feature: issued currency
  In order to play with issued currencies
  As a player
  I want to be able have fun!

  Background:
    Given I am logged into my account
    Given I have "circle,currency" privs
    Given a circle "the circle"
    Given an "Issued" currency "WE"
    Given I am a "member" of currency "WE"
    Given "TT" is an "issuer" of currency "WE"
    Given "Joe" is a "member" of currency "WE"
    And I bind "WE" to "the circle"
    When I make "Joe" a "member" of "the circle"
    When I make "TT" a "member" of "the circle"
    When I make "anonymous" a "member" of "the circle"

  Scenario: Users makes a play in a tracked currency with no money
    When I go to the my currencies page
    And I follow "WE"
    Then I should be taken to the currency account play page for "Anonymous User's WE member account"
    And I should see "My Currencies WE: pay"
    And I should see "Balance: 0"
    When I select "Joe User's WE member account" from "play_to"
    And I fill in "play_amount" with "20"
    And I fill in "play[memo]" with "leg waxing"
    And I press "Record Play"
    And I should see "Insufficient Funds"
    And I should see "Balance: 0"

  Scenario: Users makes a play in a tracked currency with money
    Given I go to the logout page
    Given I log in as "TT"
    When I go to the my currencies page
    And I follow "WE"
    And I should see "In Circulation: 0; Volume: 0"
    When I select "Anonymous User's WE member account" from "play_to"
    And I fill in "play_amount" with "20"
    And I fill in "play[memo]" with "opening balance"
    And I press "Record Play"
    Then I should be taken to the dashboard page
    And I should see /Volume:.*20/
    And I should see /Circulation.*20/
    When I go to the logout page
    And I log in as "anonymous"
    And I go to the my currencies page
    And I follow "WE"
    And I select "Joe User's WE member account" from "play_to"
    And I fill in "play_amount" with "5"
    And I fill in "play[memo]" with "leg waxing"
    And I press "Record Play"
    And I should see /Balance.*15/
    
