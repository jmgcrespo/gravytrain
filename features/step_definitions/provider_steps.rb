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

Then(/^my Provider account is created$/) do
  expect(Provider.first.name).to eq('Dave')
end

Then(/^I see a confirmatino message$/) do
  page.has_content?('Welcome to Gravy Train!')
end

Then(/^I see an error message$/) do
  page.has_content?('Terms and conditions must be accepted!')
end

Then(/^my Provider account is not created$/) do
  expect(Provider.first).to eq(nil)
end
