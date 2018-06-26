require_relative 'config'
require 'active_record'

class Tag < ActiveRecord::Base
  has_many :restaurant_tags
  has_many :restaurants, through: :restaurant_tags
end
