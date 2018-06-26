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
end
