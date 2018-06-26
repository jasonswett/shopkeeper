#!/usr/bin/env ruby

require_relative 'config'
require_relative 'product'

Product.all.each do |p|
  puts p.name
end
