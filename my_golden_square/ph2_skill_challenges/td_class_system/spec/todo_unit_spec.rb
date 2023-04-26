require "todo"

describe "task method" do
  it "returns task" do
    task_1 = Todo.new("mop the floor")
    expect(task_1.task).to eq "mop the floor"
  end
  
  context "when the task is not done" do
    it "returns false" do 
      task_1 = Todo.new("mop the floor")
      expect(task_1.done?).to eq false
    end 
  end
  
  context "when the task is done" do
    it "returns true" do 
      task_1 = Todo.new("mop the floor")
      task_1.mark_done!
      expect(task_1.done?).to eq true
    end 
  end
  
end