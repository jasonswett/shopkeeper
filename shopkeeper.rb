#!/usr/bin/env ruby

require_relative 'config/database'
require_relative 'models/product'

Product.all.each do |p|
  puts p.name
end
