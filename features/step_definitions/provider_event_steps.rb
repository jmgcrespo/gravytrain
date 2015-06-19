Given(/^a registered provider with events$/) do
  @provider = Provider.create(
    name: "Manu",
    email: "manu@caracola.com",
    address: "Rue del Percebe",
    postcode: "28045",
    about_me: "Simply great!",
    terms_and_conditions: "1"
  )
  
  @event1 = @provider.events.create!(name: "Parkour and BBQ", description: "What else do you need.")
  @event2 = @provider.events.create!(name: "Extreme TDD session")
  @event3 = @provider.events.create!(name: "Ben Lovell mute session")
end

When(/^I view the provider's events$/) do
  visit provider_events_path(@provider)

  expect(page.status_code).to be < 400
end

Then(/^I see a list of events offered by the provider$/) do
  expect(page.body).to match(/Parkour and BBQ/)
  expect(page.body).to match(/Extreme TDD session/)
  expect(page.body).to match(/Ben Lovell mute session/)
end
