# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a user
> So that I can record my experiences
> I want to keep a regular diary
  ** key words: diary to record experiences

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries
  ** key words: diary to read past entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed
  ** key words: diary to select entries based on minutes and wpm

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary
  ** key words: todo_list to track tasks # they come from the diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries
  ** key words: contact_list to track phone numbers # they come from the diary



## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_


```
┌──────────────────────────────┐
│ MyDiary(DiaryEntry, TodoList)│
│                              │
│- add(entry / task)           │
│- list_entries                │
│- find_best_entry             │
│- list_todos                  │
│- list_numbers                │
└───────────┬──────────────────┘

┌─────────────────────────┐
│ DiaryEntry              │
│                         │
│- title                  │
│- content                │
│- count_words            │
│- show_numbers           │
└─────────────────────────┘
┌─────────────────────────┐
│ TodoList                │
│                         │
│ - show_todo             │
│ - mark_done!          │
│ - is_done?              │
└─────────────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
class MyDiary
  def initialize
    # ...
  end

  def add(entry/todo) # entry or todo are instances of DiaryEntry or TodoList 
    # entry/todo gets added to the array
    # Returns nothing
  end

  def list_entries
    # Returns a list of all entries
  end
  
  def find_best_entry # parameteres wmp, minutes
    # Returns the longest entry that user can read in a given time (minutes)
  end
  
  def list_todos 
    # returns a list of todos from Todo
  end
  
  def list_numbers 
    # returns a list of all numbers from all DiaryEntry entries
  end
end

class DiaryEntry
  def initialize(title, content) # title and content are both strings
  end

  def title
    # Returns title as an array
  end
  
  def content
    # Returns content as an array
  end
  
  def count_words # is an integer
    # returns number of words per entry
  end
  
  def show_numbers
    # Returns all phone numbers from this entry
  end
end

class TodoList
  def initialize
    # ...
  end
  
  def show_todo # is a string
    # returns the todo
  end
  
  def mark_done! 
    # marks the todo as compelted (=true) 
    # returns => true
  end
  
  def is_done? 
    # returns true or false
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# 1
diary = MyDiary.new
entry_1 = DiaryEntry.new("my title","my content")
entry_2 = DiaryEntry.new("my title 2","my content 2")
diary.add(entry_1)
diary.add(entry_2)
diary.list_entries => [entry_1, entry_2]

# 2
diary = MyDiary.new
entry_1 = DiaryEntry.new("my title", "Today is Monday, the first day")
diary.add(entry_1)
diary.find_best_entry(2,3) => [entry_1]

# 3
diary = MyDiary.new
entry_1 = DiaryEntry.new("my title", "Today is Monday, the first day")
entry_2 = DiaryEntry.new("my title", "Today is Monday, the first day of the")
entry_3 = DiaryEntry.new("my title", "Today is Monday, the")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.find_best_entry(2,3) => [entry_1]

# 4
todo = MyDiary.new
todo_1 = Todo.new("mop the floor")
todo_2 = Todo.new("walk the dog")
todo.add(todo_1)
todo.add(todo_2)
todo.list_todos => ["mop the floor", "walk the dog"]

# 5
todo = MyDiary.new
todo_1 = Todo.new("mop the floor")
todo_2 = Todo.new("walk the dog")
todo.add(todo_1)
todo.add(todo_2)
todo.list_todos => ["mop the floor" false, "walk the dog" false]

# 6
todo = MyDiary.new
todo_1 = Todo.new("mop the floor")
todo_2 = Todo.new("walk the dog")
todo_1.mark_done!
todo.add(todo_1)
todo.add(todo_2)
todo.list_todos => ["mop the floor" true, "walk the dog" false]

#7 
diary = MyDiary.new
entry_1 = DiaryEntry.new("my_title","my number is 07889966777")
diary.add(entry_1)
diary.list_numbers => [07889966777]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# 1
todo_1 = TodoList.new("mop the floor")
todo_1.show_todo => "mop the floor"

# 2
todo_1 = TodoList.new("mop the floor")
todo_1.is_done? => false

# 3
todo_1 = TodoList.new("mop the floor")
todo_1.mark_done!
todo_1.is_done? => true

# 4
entry_1 = DiaryEntry.new("my_title","my_content")
entry_1.title => "my_title"

# 5
entry_1 = DiaryEntry.new("my_title","my_content")
entry_1.content => "my_content"

# 6
entry_1 = DiaryEntry.new("my_title","my_content is this")
entry_1.count_words = 3

# 7
entry_1 = DiaryEntry.new("my_title","my number is 07889966777")
entry_1 = 07889966777

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._