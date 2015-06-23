Feature: Provider can see their details
  As a Provider
  I want to see my details
  So that I can see if they are accurate

  Scenario: A Provider account is created
    Given a registered Provider
    When I am on his profile page
    Then I see Provider details
