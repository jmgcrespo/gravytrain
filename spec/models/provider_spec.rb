require 'rails_helper'

RSpec.describe Provider do
  describe 'validation' do
    let(:provider) do
      provider = Provider.new(
        name: 'Ben',
        address: '10',
        postcode: 'RM1',
        about_me: 'Stuff',
        email: 'me@me.com',
        terms_and_conditions: '1'
      )
    end

    it 'is valid with valid attributes' do
      expect(provider).to be_valid
    end

    it 'expects the terms to be accepted' do
      provider.terms_and_conditions = '0'

      expect(provider).to_not be_valid
    end

    it 'expects required fields to be present' do
      temp_provider = provider.dup
      [:name=, :address=, :postcode=, :email=].each do |field|
        temp_provider.send(field, '')
        expect(temp_provider).not_to be_valid, "Failed #{field} validation"
      end
    end

    it 'email address is unique' do
      temp_provider = provider.dup
      provider.save

      expect(temp_provider).not_to be_valid
    end

    it 'expects an email to look like an email' do
      provider.email = 'invalid_email'

      expect(provider).not_to be_valid
    end
  end
end
