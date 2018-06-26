#!/usr/bin/env ruby

require_relative 'ui'
require_relative 'actions'
require_relative 'tag'
require_relative 'restaurant'

ARGV[0] = 'restaurants_list' if ARGV[0] == nil

Actions.register_action(ARGV)
