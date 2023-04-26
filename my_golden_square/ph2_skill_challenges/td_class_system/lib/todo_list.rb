# require "./todo"

class TodoList
  def initialize
    @todos = [] 
  end

  def add(todo) # todo is an instance of Todo
    @todos << todo 
  end

  def incomplete
    fail "There are no todos" unless @todos.length > 0
    incomplete_task = @todos.reject { |todo| todo.done? }
    # incomplete_task = @todos.select { |todo| !todo.done? } # done? = false, !done? = true
    if incomplete_task.length > 0
      return incomplete_task.map { |todo| todo.task }
    else
      return []
    end
    return incomplete_task
  end     

  def complete
    fail "All tasks are completed" unless @todos.length > 0
    complete_task = @todos.select { |todo| todo.done?} # mark_done is true
    if complete_task.length > 0
      return complete_task.map { |todo| todo.task }
    else
      return []
    end
    return complete_task
    # Returns all complete todos
  end

  def give_up!
    @todos.each { |todo| todo.mark_done! }
    # Marks all todos as complete
  end
end

# my_todos = TodoList.new
# todo1 = Todo.new("mop the floor")
# todo2 = Todo.new("wash the car")
# todo3 = Todo.new("walk the dog")
# my_todos.add(todo1)
# my_todos.add(todo2)
# my_todos.add(todo3)
# puts todo1.done?
# todo1.mark_done!
# puts todo1.done?
# puts my_todos.incomplete
# puts "_______"
# puts my_todos.complete