require_relative 'menu_item'

class UI
  def exit_with_message(message)
    puts message
    exit
  end

  def list_restaurants(restaurants)
    restaurants.each do |row|
      puts row['name']
    end
  end

  def list_restaurants_with_tag(tag_name)
    restaurants = Restaurant.joins(:restaurant_tags)
                            .joins(:tags)
                            .where('lower(tags.name) = ?', tag_name.downcase)
                            .uniq

    exit_with_message "No restaurants with tag \"#{tag_name}\"" unless restaurants.any?
    list_restaurants(restaurants)
  end

  def show_restaurant_detail(restaurant)
    puts '--------------------'
    puts restaurant['name']
    puts restaurant['phone']
    puts '--------------------'
    puts

    puts 'Menu'
    puts '----'

    menu_items = restaurant.menu_items

    if menu_items.any?
      menu_items.each do |menu_item|
        puts "#{menu_item['name']} ($#{menu_item['price'].to_f / 100})"
      end
    else
      puts '(No menu items)'
    end
  end

  def list_tags
    Tag.all.each do |row|
      puts row['name']
    end
  end
end
