class Menu
  def initialize
    @menu_list = []
  end
  
  def add_dish(name, price)  
    @menu_list << {:name => name, :price => price}
  end
  
  def remove_dish(name)
    @menu_list.reject! { |item| item[:name] == name }
  end
  
  def show_list
    fail "The menu is empty" unless !@menu_list.empty?
    item = @menu_list.map do |dish|
      "#{dish[:name]} £#{dish[:price]}"
    end
    return item.join(", ")
  end
  
  def total_price # working fine on here, but not working in cart.rb
    total = @menu_list.reduce(0) { |sum, price| sum + price[:price] }
    # would I declare att_reader :total? 
    return total
  end
end

order = Menu.new
order.add_dish("chicken strips", 5)
order.add_dish("ribs", 7)
order.add_dish("ribs", 7)
order.remove_dish("chicken strips")
puts order.total_price