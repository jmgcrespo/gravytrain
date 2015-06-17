require 'rails_helper'

RSpec.describe Provider do
  describe 'validation' do
    let(:provider) do
      provider = Provider.new(
        name: 'Ben',
        address: '10',
        postcode: 'RM1',
        about_me: 'Stuff',
        paypal_email: 'me@me.com',
        accepted_terms: '1'
      )
    end

    it 'is valid with valid attributes' do
      expect(provider).to be_valid
    end

    it 'expects the terms to be accepted' do
      provider.accepted_terms = '0'

      expect(provider).to_not be_valid
    end
  end
end
