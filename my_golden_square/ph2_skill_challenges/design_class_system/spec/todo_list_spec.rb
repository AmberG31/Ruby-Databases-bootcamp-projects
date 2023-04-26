require "todo_list"

RSpec.describe "how the TodoList works" do
  context "#show_todo when one todo is added" do
    it "returns the task" do
      todo_1 = TodoList.new("mop the floor")
      expect(todo_1.show_todo).to eq "mop the floor"    
    end
  end
  
  context "#is_done? when the task is not done" do
    it "returns false" do
      todo_1 = TodoList.new("mop the floor")
      expect(todo_1.is_done?).to eq false   
    end
  end
  
  context "when #mark_done!" do
    it "returns #is_done? true" do
      todo_1 = TodoList.new("mop the floor")
      todo_1.mark_done!
      expect(todo_1.is_done?).to eq true
    end
  end  
end