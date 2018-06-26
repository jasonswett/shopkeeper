require 'rspec'
require_relative '../config/database'
require_relative '../models/product'

RSpec.describe Product do
  describe 'when name is missing' do
    it 'is not valid' do
      product = Product.new(price_cents: 10000)
      expect(product).not_to be_valid
    end
  end

  describe 'price' do
    let!(:product) do
      Product.new(
        name: 'Solid Gold Stapler',
        price_cents: '999999'
      )
    end

    describe '#formatted_price' do
      it 'formats a price' do
        expect(product.formatted_price).to eq('$9999.99')
      end
    end

    describe '#price_in_dollars' do
      it 'divides by 100' do
        expect(product.price_in_dollars).to eq(9999.99)
      end
    end
  end
end
