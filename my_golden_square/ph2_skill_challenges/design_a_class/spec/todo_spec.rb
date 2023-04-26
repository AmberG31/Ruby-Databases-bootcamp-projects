require "todo"

describe TodoList do
  context "add method" do
    it "when no task added, returns empty string" do
      task1 = TodoList.new
      expect(task1.list).to eq ""
    end
    
    it "when one task added, returns one task" do
      task1 = TodoList.new
      task1.add("Hoover upstairs")
      expect(task1.list).to eq "Hoover upstairs"
    end
    
    it "when two or more tasks added, returns the list" do
      task1 = TodoList.new
      task1.add("Hoover upstairs")
      task1.add("Do loundry")
      task1.add("Walk the dog")
      expect(task1.list).to eq "Hoover upstairs, Do loundry, Walk the dog"
    end
    
  end

  context "complete method" do
    it "when a task is completed, remove it from the list" do
      task1 = TodoList.new
      task1.add("Hoover upstairs")
      task1.add("Do loundry")
      task1.complete("Do loundry")
      expect(task1.list).to eq "Hoover upstairs"
    end
    
    it "return an error if a non existant task has been passed" do
      task1 = TodoList.new
      task1.add("Hoover upstairs")
      expect{ task1.complete("Hoover downstairs") }.to raise_error "No such task"
    end
    
  end

end