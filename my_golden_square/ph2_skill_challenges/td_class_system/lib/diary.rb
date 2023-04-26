# File: lib/diary.rb
class Diary
  def initialize
    @entries = []
  end

  def add(entry) 
    @entries << entry
  end

  def all
    return @entries
  end

  def count_words
    total_entry_count = @entries.sum(&:count_words) 
    # calling count_words method from diary_entry.rb
    return total_entry_count
  end

  def reading_time(wpm)  
    total_time_to_read = (count_words.to_f / wpm).ceil
    return total_time_to_read
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    return readable_entries(wpm, minutes).max_by(&:count_words)
  end
  
  private
  
  def readable_entries(wpm, minutes)
    return @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end
end