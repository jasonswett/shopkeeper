#!/usr/bin/env ruby

require_relative 'config/database'
require_relative 'models/product'

Product.all.each do |product|
  puts "#{product.name} (#{product.formatted_price})"
end
