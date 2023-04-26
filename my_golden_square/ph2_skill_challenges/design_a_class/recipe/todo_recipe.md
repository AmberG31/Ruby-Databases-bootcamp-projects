# Single-Class Programs Design Recipe
 
## 1. Describe the Problem
 
> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list.


## 2. Design the Class Interface

``` ruby

class TodoList
  def initializer
    # @tasks - will be an empty array where new tasks will be stored
  end
  
  def add(task) # adds a task to an array
    # returns nothing
  end
  
  def list
    # shows a list of all or just completed tasks 
  end
  
  def complete(task) # task is a string which will be completed
    # throws an error if there is no such task
  end
end
  
```


## 3. Create Examples as Tests

``` ruby
# 1
todo_list = TodoList.new
todo_list.list # => []

# 2
todo_list = TodoList.new
todo_list.add("Hoover upstairs")
todo_list.list # => ["Hoover upstairs"]

# 3
todo_list = TodoList.new
todo_list.add("Hoover upstairs")
todo_list.add("Do loundry")
todo_list.list # => ["Hoover upstairs", "Do loundry"]

# 4
todo_list = TodoList.new
todo_list.add("Hoover upstairs")
todo_list.add("Do loundry")
todo_list.complete("Hoover upstairs")
todo_list.list # => ["Do loundry"]

# 5
todo_list = TodoList.new
todo_list.add("Hoover upstairs")
todo_list.complete("Hoover downstairs")
todo_list.list # => Error: "There is no such task"


```

 
## 4. Implement the Behaviour

> For each example you create as a test, implement the behaviour that allows the
> class to behave according to your example.
