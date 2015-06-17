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
      temp_provider = provider.clone

      [ :name=, :address=, :postcode=, :email= ].each do |field|
        temp_provider.send(field,"")
        expect(temp_provider).not_to be_valid, "Failed #{field} validation"
      end
    end
  end
end
