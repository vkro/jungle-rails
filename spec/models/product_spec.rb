require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do

    before :each do
      @category = Category.new(name: "test category")
      @product = Product.new(name: 'product name', price_cents: 1, quantity: 1, category: @category)
    end

    it 'is valid with valid attributes' do
      expect(@product).to be_valid
    end
    
    it 'is not valid without a name' do
      @product.name = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product.category = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
  
end
