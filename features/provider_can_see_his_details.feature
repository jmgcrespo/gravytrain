Feature: Provider can see his details
  As a Provider
  I want to see my details
  So that I can see if they are accurate

  Scenario: A Provider account is created
    Given a Provider exist
    When I am on the show page
    Then I see Provider details
