require 'rails_helper'

RSpec.feature 'Provider can see his details' do


  scenario 'A Provider see his details' do
    @provider = Provider.create(name: "Manu",
      email: "manu@caracola.com",
      address: "Rue del Percebe",
      postcode: "28045",
      about_me: "Simply great!",
      terms_and_conditions: "1")

    visit provider_path(@provider)

    expect(page.has_content?("Rue del Percebe")).to be true
  end

end
