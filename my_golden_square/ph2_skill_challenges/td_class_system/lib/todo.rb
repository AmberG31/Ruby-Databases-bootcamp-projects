class Todo
  def initialize(task) 
    @task = task
    @is_done = false
  end

  def task
    return @task
  end

  def mark_done!
    @is_done = true
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    return @is_done
    # Returns true if the task is done
    # Otherwise, false
  end
end

# todo_1 = Todo.new("mop the floor")
# todo_1.mark_done!
# puts todo_1.done?
