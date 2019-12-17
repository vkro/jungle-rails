require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do

    it 'is valid with valid attributes' do
      @category = Category.new(name: "test category")
      expect(Product.new(name: 'anything', price_cents: 1, quantity: 1, category: @category)).to be_valid
    end
    
    it 'is not valid without a name' do
      @category = Category.new(name: "test category")
      @product = Product.new(name: nil, price_cents: 1, quantity: 1, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.new(name: "test category")
      @product = Product.new(name: 'product name', price_cents: nil, quantity: 1, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @category = Category.new(name: "test category")
      @product = Product.new(name: 'product name', price_cents: 1, quantity: nil, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product = Product.new(name: 'product name', price_cents: 1, quantity: nil, category: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end


  end

end
