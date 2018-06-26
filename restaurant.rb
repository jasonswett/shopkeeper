require_relative 'config'
require_relative 'restaurant_tag'
require_relative 'tag'
require_relative 'menu_item'
require 'active_record'

class Restaurant < ActiveRecord::Base
  has_many :restaurant_tags
  has_many :tags, through: :restaurant_tags
  has_many :menu_items
end
