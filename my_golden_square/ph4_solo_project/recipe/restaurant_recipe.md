# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices.

> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes.

> As a customer
> So that I can verify that my order is correct
> I would like to see an itemised receipt with a grand total.

> Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

> Fair warning: if you push your Twilio API Key to a public Github repository, anyone will be able to see and use it. 
> What are the security implications of that? How will you keep that information out of your repository?


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_


```
┌──────────────────────────────┐
│ Restaurant                   │
│                              │
│- add_to_menu(name,price)     │
 - view_menu                   │
│- add_to_cart(name, quantity) │
│- remove_from_cart(name, quantity) │
│- view_my_cart  
│- order 
└───────────┬──────────────────┘

┌─────────────────────────┐
│ Cart                    │
│                         │
│- add(name, quantity)
 - remove(name, quantity)
 - view_cart
 - print_receipt          │
└─────────────────────────┘

┌─────────────────────────┐
│ Menu                    │
│                         │
│- add_dish(name, price)  │
│- remove_dish(name)
│- show_list
 - total_price
└─────────────────────────┘

┌─────────────────────────┐
│ FakeSMS                 │
│                         │
│- send_SMS)              │
└─────────────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
# Has been updated to match the new layout of classes

class Restaurant

  def initialize
    # ...
  end
  
  def add_to_menu
    # Is an instance of Menu add_dish
  end

  def view_menu #INTEG
    # Returns the list of dishes with prices from Menu
  end

  def add_to_cart(dish, quantity) #UNIT
    # dish and quantity added from the view_menu to the cart (hash)
    # returns nothing
  end
  
  def remove_from_cart(dish, quantity) #UNIT
    # dish and quantity removed from the cart (hash)
    # returns nothing
  end
  
  def view_cart #UNIT
    # returns dish and price of the items added in the cart (hash)
  end
  
  def order #INTEG
    # when ordered, a receipt is printed and SMS is sent 
  end
end

class Cart
  def initialize 
    # ..
  end

  def add(name, quantity)
    # adds name and quantity of the dish to the @cart array
  end
  
  def remove(name, quantity)
    # removes name and quantity from @cart array
  end
  
  def view_cart
    # returns list of dishes and their quantities 
  end

  def print_receipt #INTEG
    # prints a list of dishes, their quantities with prices and grand total
    # sends SMS to the customer with eta of the order
  end
end

class Menu
  def initialize
    # ...
  end
  
  def add_dish(name, price)  #UNIT
    # adds a dish to a hash
  end
  
  def remove_dish(name)  #UNIT
    # removes dish from a hash
  end
  
  def show_list #UNIT
    # returns the list of dishes added
  end
  
  def total_price
    # returns the sum of dishes 
  end
end
  
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# DOES NOT MATCH THE NEW LAYOUT

# EXAMPLE

# 1
order = Restaurant.new
new_order = Menu.new("chicken strips" 5)
new_order.add
new_order.show_list
order.view_menu => "chicken strips" price: £5

# 2
order = Restaurant.new
new_order = Menu.new("chicken strips" 5)
new_order = Menu.new("ribs" 7)
new_order.add
new_order.show_list
order.view_menu => "chicken strips" price: £5, "ribs" price: £7

# 3
orders = Restaurant.new
new_order = Menu.new("chicken strips" 5)
new_order.add
orders.add_to_cart(chicken strips, 1)
orders.order => "Thank you! Your order was placed and will be delivered before 18:52"
=> print_receipt
=> send_SMS

# 4
orders = Restaurant.new
new_order = Menu.new("chicken strips" 5)
new_order.add
orders.add_to_cart(chicken strips, 1)
orders.order => "Order accepted. You will receive SMS with delivery time shortly"
=> print_receipt
=> send_SMS

# 5
orders = Restaurant.new
new_order = Menu.new("chicken strips" 5)
new_order.add
orders1.add_to_cart(chicken strips, 1)
orders1.order
orders.print_receipt (chicken strips. Grand total £5)

# 6
orders = Restaurant.new
new_order = Menu.new("chicken strips" 5)
new_order = Menu.new("ribs" 7)
new_order.add
orders1.add_to_cart(chicken strips, 1)
orders2.add_to_cart(ribs, 1)
orders.order
orders.print_receipt => "chicken strips, ribs. Grand total £12"

# 7
orders = Restaurant.new
new_order = Menu.new("chicken strips" 5)
new_order = Menu.new("ribs" 7)
new_order.add
orders1.add_to_cart(chicken strips, 2)
orders2.add_to_cart(ribs, 2)
orders.order
orders.print_receipt => "chicken strips x2, price: £5. ribs x2, prints: £7. Grand total £24"

# 8
orders = Restaurant.new
new_order = Menu.new("chicken strips" 5)
new_order.add
orders1.add_to_cart(chicken strips, 1)
orders.order
orders.send_SMS => "Thank you! Your order was placed and will be delivered before /18:52/"


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# 1
order = Menu.new
order.add_dish("chicken strips" 5)
order.show_list => "chicken strips £5"

# 2
order = Menu.new
order.add_dish("chicken strips" 5)
order.add_dish("ribs" 7)
order.show_list => "chicken strips" £5, "ribs" £7

# 3
order = Menu.new
order.add_dish("chicken strips" 5)
order.add_dish("ribs" 7)
order.remove_dish("chicken strips")
order.show_list => "ribs" £7

# 4
order = Menu.new
order.add_dish("chicken strips" 5)
order.remove_dish("chicken strips")
order.show_list => "The menu is empty"

# 5
my_order = Restaurant.new
my_order.add_to_cart("chicken strips", 1)
my_order.view_cart => ("chicken strips" x1)

# 6
my_order = Restaurant.new
my_order.add_to_cart("chicken strips", 3)
my_order.add_to_cart("ribs", 1)
my_order.view_cart => ("chicken strips" x3, "ribs" x1)


# 7
my_order = Restaurant.new
my_order.add_to_cart("chicken strips", 3)
my_order.add_to_cart("ribs", 1)
my_order.remove_from_cart("ribs", 1)
my_order.view_cart => ("chicken strips" x3)

# 8
my_order = Restaurant.new
my_order.add_to_cart("chicken strips", 3)
my_order.add_to_cart("ribs", 1)
my_order.remove_from_cart("chicken strips", 2)
my_order.view_cart => ("chicken strips" x1, "ribs" x1)

# 9
my_order = Restaurant.new
my_order.add_to_cart("chicken strips", 1)
my_order.remove_from_cart("chicken strips", 1)
my_order.view_cart => "Your cart is empty"
  
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._