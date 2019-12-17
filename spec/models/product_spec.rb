require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do

    it 'is valid with valid attributes' do
      test_cat = Category.new(name: "test category")
      expect(Product.new(name: 'anything', price_cents: 1, quantity: 1, category: test_cat)).to be_valid
    end

    
    it 'is not valid without a name'
    # validates :name, presence: true

    it 'is not valid without a price'

    #validates :price, presence: true

    it 'is not valid without a quantity'
    #validates :quantitiy, presence: true

    it 'is not valid without a category'
    #validates :category, presence: true


  end

end
