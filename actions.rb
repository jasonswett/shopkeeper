class Actions
  @@ui = UI.new

  ACTION_WHITELIST = %w(
    tags_list
    restaurants_list
    restaurants_detail
    restaurants_add
  )

  def self.register_action(args)
    first_arg = args[0].gsub(/:/, '_')

    if ACTION_WHITELIST.include?(first_arg)
      self.send(first_arg, args)
    end

    self.default
  end

  def self.default
    unless Tag.where('lower(name) = ?', ARGV[0].downcase).any?
      @@ui.exit_with_message "No such tag \"#{ARGV[0]}\""
    end

    @@ui.list_restaurants_with_tag(ARGV[0])
  end

  def self.tags_list(args)
    @@ui.list_tags
    exit
  end

  def self.restaurants_list(args)
    @@ui.list_restaurants(Restaurant.all)
    exit
  end

  def self.restaurants_detail(args)
    restaurant = Restaurant.find_by(name: args[1])
    @@ui.show_restaurant_detail(restaurant)
    exit
  end

  def self.restaurants_add(args)
    Restaurant.create(name: args[1], phone: args[2])
    exit
  end
end
