require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do
    
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

  scenario "From home page, they click on product details button, and see the product page" do
    # ACT
    visit root_path
    # async - waits until at least one element matching selector appears on page
    click_on('Details', match: :first)

    # DEBUG / VERIFY
    # async - as above
    expect(page).to have_css('section.products-show')
    save_screenshot
  end




end
