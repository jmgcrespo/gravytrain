Given(/^no Providers exist$/) do
 Provider.delete_all
end

When(/^I am on the registration page$/) do
  visit new_provider_path
end

When(/^I complete the required fields$/) do
  fill_in 'Name', with: 'Dave'
  fill_in 'Address', with: '10 Pie Lane'
  fill_in 'Postcode', with: 'RG14PZ'
  fill_in 'About me', with: 'I´m the best'
  fill_in 'Email', with: 'ben@ben.com'
end

When(/^I check terms and conditions$/) do
  check 'Terms and conditions'
end

When(/^I submit my information$/) do
  click_button('Create Provider')
end

Then(/^my Provider account is created unconfirmed$/) do
  expect(Provider.first.name).to eq('Dave')
  expect(Provider.first.confirmed).to be false
end

Then(/^I see a confirmatino message$/) do
  expect(page.body).to match(/Welcome to Gravy Train!/)
end

Then(/^I see an error message$/) do
  page.has_content?('Terms and conditions must be accepted!')
end

Then(/^my Provider account is not created$/) do
  expect(Provider.first).to eq(nil)
end

Given(/^a registered Provider$/) do
  @provider = Provider.create(name: "Manu", email: "manu@caracola.com", address: "Rue del Percebe",
    postcode: "28045", about_me: "Simply great!", terms_and_conditions: "1")
end

When(/^I am on his profile page$/) do
  visit(provider_path(@provider))
end

Then(/^I see Provider details$/) do
  expect(page.has_content?('Rue del Percebe')).to be true
end

Then(/^I see a confirmation email$/) do
  expect(ActionMailer::Base.deliveries).not_to be_empty
end

Given(/^I have registered$/) do
  @provider = Provider.create(
    name: "Manu",
    email: "manu@caracola.com",
    address: "Rue del Percebe",
    postcode: "28045",
    about_me: "Simply great!",
    terms_and_conditions: "1"
  )
end

When(/^I follow the link within my confirmation email$/) do
  visit confirm_provider_path(@provider)
end

Then(/^my account is confirmed$/) do
  expect(@provider.reload.confirmed).to be true
end

Then(/^I am directed to my profile$/) do
  expect(page.body).to match(/Your account is now confirmed/)
end

