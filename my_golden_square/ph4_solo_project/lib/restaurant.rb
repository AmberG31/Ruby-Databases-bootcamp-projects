# require "./menu"
# require "./cart"
# require "./fake_SMS"

class Restaurant

  def initialize
   @menu = Menu.new
   @my_cart = Cart.new
   # @SMS = FakeSMS.new(account_sid, auth_token)
  end

  def add_to_menu(name, price) #is an instance of Menu add_dish - 
    @menu.add_dish(name, price)
  end
  
  def view_menu #hot to get this display show_list from Menu file
    return @menu.show_list
  end

  def add_to_cart(name, quantity) 
    @my_cart.add(name, quantity)
  end
  
  def remove_from_cart(name, quantity)
    @my_cart.remove(name, quantity)
  end
  
  def view_my_cart
    return @my_cart.view_cart
  end
  
  def order
    @my_cart.print_receipt #
    # @SMS.send_SMS
  end
end

# order = Restaurant.new
# order.add_to_cart("chicken strips", 1)
# puts order.order


# things to check: 
# 1. How to write twilio rspec? 
# 2. How to create ENV variables? (fake_SMS)
# 3. How to test SMS with ruby? 
# 4. To use total_price from menu.rb in cart.rb for print_receipt. Do I need to declare new instance variable? is it enought ot add "require"?  
# 5. Should I add :price in cart.rb too and amend all my tests or is there another way to calculate total cost? 