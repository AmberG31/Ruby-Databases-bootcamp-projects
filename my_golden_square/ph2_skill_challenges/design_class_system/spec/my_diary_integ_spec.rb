require "my_diary"
require "diary_entry"
require "todo_list"

RSpec.describe "MyDiary integration" do
  
  context "#list_entries: when two diary entries are given" do
    it "return both entries in the array" do
      diary = MyDiary.new
      entry_1 = DiaryEntry.new("my title","my content")
      entry_2 = DiaryEntry.new("my title 2","my content 2")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.list_entries).to eq [entry_1, entry_2] 
   end
  end
  
  context "#find_best_entry: when 1 diary entry is given" do
    it "return the readable entry based on given wpm and minutes available" do
      diary = MyDiary.new
      entry_1 = DiaryEntry.new("my title", "Today is Monday, the first day")
      diary.add(entry_1)
      expect(diary.find_best_entry(2,3)).to eq entry_1
    end
  end
  
  context "#find_best_entry: when 3 diary entries are given" do
    it "return the readable entry based on given wpm and minutes available" do
      diary = MyDiary.new
      entry_1 = DiaryEntry.new("my title", "Today is Monday, the first day")
      entry_2 = DiaryEntry.new("my title", "Today is Monday, the first day of the")
      entry_3 = DiaryEntry.new("my title", "Today is Monday, the")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.find_best_entry(2,3)).to eq entry_1
    end
  end
  
  context "#list_numbers: when there is a number in diary_entry" do
    it "return the list of numbers" do
      diary = MyDiary.new
      entry_1 = DiaryEntry.new("my_title","my number is 07889966777")
      diary.add(entry_1)
      expect(diary.list_numbers).to eq "07889966777"
    end
  end
  
  context "#list_numbers: when there are three numbers in diary_entry" do
    it "return the list of numbers" do
      diary = MyDiary.new
      entry_1 = DiaryEntry.new("my_title1","my number is 07889966777")
      entry_2 = DiaryEntry.new("my_title2","my number is 07889966888")
      entry_3 = DiaryEntry.new("my_title3","my number is 07889966999")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.list_numbers).to eq "07889966777, 07889966888, 07889966999"
    end
  end
  
  context "#list_todos: when two todos are added" do
    it "return todos in the array" do
      todo = MyDiary.new
      todo_1 = TodoList.new("mop the floor")
      todo_2 = TodoList.new("walk the dog")
      todo.add(todo_1)
      todo.add(todo_2)
      expect(todo.list_todos).to eq ["mop the floor", "walk the dog"]
    end
  end
  
  context "#list_todos: when two todos are added" do
    it "return todos in the array" do
      todo = MyDiary.new
      todo_1 = TodoList.new("mop the floor")
      todo_2 = TodoList.new("walk the dog")
      todo_1.mark_done!
      todo.add(todo_1)
      todo.add(todo_2)
      expect(todo.list_todos).to eq ["walk the dog"]
    end
  end
  
end