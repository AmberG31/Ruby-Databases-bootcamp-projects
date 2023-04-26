class MyDiary
  def initialize
    @entries = []
    @todos = []
  end

  def add(entry)
    if entry.instance_of?(DiaryEntry)
      @entries << entry
    else
      @todos << entry
    end
  end

  def list_entries
    return @entries
  end
  
  def find_best_entry(wpm, minutes)
    return readable_entries(wpm, minutes).max_by(&:count_words)
  end
  
  def list_todos 
    incomplete_task = @todos.reject { |todo| todo.is_done? }
    if incomplete_task.length > 0
      return incomplete_task.map { |todo| todo.show_todo }
    else
      return []
    end
    return incomplete_task
  end
  
  def list_numbers # returns a list of all numbers from all DiaryEntry entries
    all_phone_numbers = []
    @entries.each do |entry|
      all_phone_numbers << entry.show_numbers
    end
    sorted_numbers = all_phone_numbers.select {|num| num.length > 0}
    sorted_numbers.join(", ")
  end
  
  private
  
  def readable_entries(wpm, minutes)
    return @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end
end