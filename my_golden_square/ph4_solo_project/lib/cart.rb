require "./menu"

class Cart
  def initialize 
    @cart = []
    @menu = Menu.new
  end
  
  def add(name, quantity) 
    @cart << {:name => name, :quantity => quantity}
  end
  
  def remove(name, quantity)
    @cart.each do |item| 
      if item[:name] == name
        item[:quantity] -= quantity
        if item[:quantity] <= 0
          @cart.delete(item)
        end
      end
    end
  end
  
  def view_cart
    fail "Your cart is empty" unless !@cart.empty?
    item = @cart.map do |dish|
      "#{dish[:name]} x#{dish[:quantity]}"
    end
    return item.join(", ")
  end

  def print_receipt # need to create / pull the price from somewhere
    total = @menu.total_price # is not pulling correctly from menu.rb. Shoul I add
                              # the :price in this file?? or should I merge Cart with Menu?
    return "#{view_cart}. Grand total: #{total}" 
  end
end

order = Cart.new
order.add("chicken strips", 1)
order.add("ribs", 3) # 7 + 7 + 7
puts order.print_receipt
#order.send_SMS