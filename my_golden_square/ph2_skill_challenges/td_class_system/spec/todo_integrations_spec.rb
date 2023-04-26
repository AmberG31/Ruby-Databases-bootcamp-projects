require "todo"
require "todo_list"

describe "#todo_list integration" do
  
  context "when there are no todos" do
    it "#incomplete raises an error" do
      todo_list = TodoList.new
      expect{ todo_list.incomplete }.to raise_error "There are no todos"
    end 
  end

  context "when a task is not done" do
    it "#incomplete returns the incompleted tasks" do
      my_todos = TodoList.new
      todo1 = Todo.new("mop the floor")
      todo2 = Todo.new("wash the car")
      todo3 = Todo.new("walk the dog")
      my_todos.add(todo1)
      my_todos.add(todo2)
      my_todos.add(todo3)
      expect(my_todos.incomplete).to eq ["mop the floor", "wash the car", "walk the dog"]
    end 
  end
  
  context "when some tasks are done and some are not" do
    it "#incomplete returns the incompleted tasks" do
      my_todos = TodoList.new
      todo1 = Todo.new("mop the floor")
      todo2 = Todo.new("wash the car")
      todo1.mark_done!
      my_todos.add(todo1)
      my_todos.add(todo2)
      expect(my_todos.incomplete).to eq ["wash the car"]
    end 
  end
  
  context "when there are no todos" do
    it "#complete raises an error" do
      todo_list = TodoList.new
      expect{ todo_list.complete }.to raise_error "All tasks are completed"
    end 
  end
  
  context "when a task is done" do
    it "#complete returns the completed tasks" do
      my_todos = TodoList.new
      todo1 = Todo.new("mop the floor")
      todo2 = Todo.new("wash the car")
      todo1.mark_done!
      todo2.mark_done!
      my_todos.add(todo1)
      my_todos.add(todo2)
      expect(my_todos.complete).to eq ["mop the floor", "wash the car"]
    end 
  end
  
  context "when some tasks are done and some are not" do
    it "#complete returns the completed tasks" do
      my_todos = TodoList.new
      todo1 = Todo.new("mop the floor")
      todo2 = Todo.new("wash the car")
      todo1.mark_done!
      my_todos.add(todo1)
      my_todos.add(todo2)
      expect(my_todos.complete).to eq ["mop the floor"]
    end 
  end
  
  
  context "when some tasks are done and some are not" do
    it "#give_up! returns the completed tasks" do
      my_todos = TodoList.new
      todo1 = Todo.new("mop the floor")
      todo2 = Todo.new("wash the car")
      todo1.mark_done!
      my_todos.add(todo1)
      my_todos.add(todo2)
      my_todos.give_up!
      expect(my_todos.complete).to eq ["mop the floor", "wash the car"]
    end 
  end
  
end
  
  
 
 # in Todo we add a task and can mark it as done or not this will be UNIT
 # tests
 # in TodoList we add the Todo and if the task was completed or incompleted 
 # in Todo that reflects in the comp and incomp methods. 