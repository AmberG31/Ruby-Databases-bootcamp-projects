class TodoList
  def initialize(todo)
    @todo = todo
    @is_done = false
  end
  
  def show_todo # is a string
    return @todo
  end
  
  def mark_done! 
    @is_done = true
  end
  
  def is_done? 
    return @is_done
  end
end