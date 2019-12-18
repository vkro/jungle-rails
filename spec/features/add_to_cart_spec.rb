require 'rails_helper'

RSpec.feature "When visitor clicks shopping-cart 'Add' button from home page, cart increases by one", type: :feature, js: true do
    
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "From home page, they click on shopping-cart button, and see the cart count increase by one" do
    # ACT
    visit root_path
    expect(page).to have_content('My Cart (0)')
    save_screenshot
    # async - waits until at least one element matching selector appears on page
    click_on('Add', match: :first)

    # DEBUG / VERIFY
    # async - as above
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end

end
