require "menu" #(TodoList)
require "restaurant" #(MyDiary)
require "cart" #(DiaryEntry)

RSpec.describe "integration of Restaurant" do
  
  context "#view_menu when there is one dish" do
    it "returns the dish and the price" do
      order = Restaurant.new #no need to call Menu.new as it's already initialized in the method
      order.add_to_menu("chicken strips", 5)
      expect(order.view_menu).to eq "chicken strips £5"
    end
  end
  
  context "#view_menu when there are two dishes" do
    it "returns the dishes and the prices" do
      order = Restaurant.new
      order.add_to_menu("chicken strips", 5)
      order.add_to_menu("ribs", 7)
      expect(order.view_menu).to eq "chicken strips £5, ribs £7"
    end
  end
  
  context "#view_menu when there are no dishes" do
    it "returns error message" do
      order = Restaurant.new
      expect{ order.view_menu }.to raise_error "The menu is empty"
    end
  end
  
  context "#view_my_cart when there is one item" do
    it "returns the item and the quantity" do
      order = Restaurant.new
      order.add_to_cart("chicken strips", 1)
      expect(order.view_my_cart).to eq "chicken strips x1"
    end
  end
  
  context "#view_my_cart when same item is added three times" do
    it "returns the item and the quantity" do
      order = Restaurant.new
      order.add_to_cart("chicken strips", 3)
      expect(order.view_my_cart).to eq "chicken strips x3"
    end
  end
  
  context "#view_my_cart when some items are added and some are removed" do
    it "returns the item and the quantity" do
      order = Restaurant.new
      order.add_to_cart("chicken strips", 3)
      order.add_to_cart("ribs", 2)
      order.remove_from_cart("chicken strips", 1)
      expect(order.view_my_cart).to eq "chicken strips x2, ribs x2"
    end
  end
  
  context "#view_my_cart when there are no items" do
    it "returns error message" do
      order = Restaurant.new
      expect{ order.view_my_cart }.to raise_error "Your cart is empty"
    end
  end
  
  #context "#order" do
  # it "returns message order is placed, detailed receipt and sends SMS" do
  #   order = Restaurant.new
  #   order.add_to_cart("chicken strips", 1)
  #   expect(order.order).to eq # => print_receipt
  #   expect(order.order).to eq # => send_SMS
  # end
  #end

end


  # # 3
# orders = Restaurant.new
# new_order = Menu.new("chicken strips" 5)
# new_order.add
# orders.add_to_cart(chicken strips, 1)
# orders.order => "Thank you! Your order was placed and will be delivered before 18:52"
# => print_receipt
# => send_SMS

# # 4
# orders = Restaurant.new
# new_order = Menu.new("chicken strips" 5)
# new_order.add
# orders.add_to_cart(chicken strips, 1)
# orders.order => "Order accepted. You will receive SMS with delivery time shortly"
# => print_receipt
# => send_SMS

# # 5
# orders = Restaurant.new
# new_order = Menu.new("chicken strips" 5)
# new_order.add
# orders1.add_to_cart(chicken strips, 1)
# orders1.order
# orders.print_receipt (chicken strips. Grand total £5)

# # 6
# orders = Restaurant.new
# new_order = Menu.new("chicken strips" 5)
# new_order = Menu.new("ribs" 7)
# new_order.add
# orders1.add_to_cart(chicken strips, 1)
# orders2.add_to_cart(ribs, 1)
# orders.order
# orders.print_receipt => "chicken strips, ribs. Grand total £12"

# # 7
# orders = Restaurant.new
# new_order = Menu.new("chicken strips" 5)
# new_order = Menu.new("ribs" 7)
# new_order.add
# orders1.add_to_cart(chicken strips, 2)
# orders2.add_to_cart(ribs, 2)
# orders.order
# orders.print_receipt => "chicken strips x2, price: £5. ribs x2, prints: £7. Grand total £24"

# # 8
# orders = Restaurant.new
# new_order = Menu.new("chicken strips" 5)
# new_order.add
# orders1.add_to_cart(chicken strips, 1)
# orders.order
# orders.send_SMS => "Thank you! Your order was placed and will be delivered before /18:52/"
