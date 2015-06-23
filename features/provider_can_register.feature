Feature: Provider can register
  As a Provider
  I want to register
  So that I can sell my Events

  Scenario: A Provider account is created
    Given no Providers exist
    When I am on the registration page
    And I complete the required fields
    And I check terms and conditions
    And I submit my information
    Then my Provider account is created unconfirmed
    And I see a confirmation message
    And I see a confirmation email

Scenario: Confirming my Provider account
    Given I have registered
    When I follow the link within my confirmation email
    Then my account is confirmed
    And I am directed to my profile

  Scenario: A Provider has to accept terms and conditions to create an account
    Given no Providers exist
    When I am on the registration page
    And I complete the required fields
    And I submit my information
    Then my Provider account is not created
    And I see an error message

