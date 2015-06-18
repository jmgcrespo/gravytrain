require 'rails_helper'

RSpec.describe ProvidersMailer do
  describe '.register' do
    let(:provider) do
      provider = Provider.create(
        name: 'Ben',
        address: '10',
        postcode: 'RM1',
        about_me: 'Stuff',
        email: 'hola@caracola.com',
        terms_and_conditions: '1'
      )
    end

    subject { ProvidersMailer.register(provider).deliver_now }

    it 'is sent to the provider' do
      expect(subject.to.first).to eq(provider.email)
    end

    it 'has a subject' do
      expect(subject.subject).to eq('Thanks for register')
    end

    it 'is addressed to provider' do
      expect(subject.body.parts.first.decoded).to include(provider.name)
    end

    it 'contains a confirmation link' do
      expect(subject.body.parts.first.decoded).to include(confirm_provider_url(provider))
    end
  end
end
