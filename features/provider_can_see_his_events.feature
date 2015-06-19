Feature: Users can see Provier´s events
  As a User
  I want to see Provider´s events
  so I can see what they offer.

Scenario: Viewing a provider's events
  Given a registered provider with events
  When I view the provider's events
  Then I see a list of events offered by the provider
