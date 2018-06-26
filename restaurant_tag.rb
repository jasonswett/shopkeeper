require_relative 'config'
require 'active_record'

class RestaurantTag < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :tag
end
