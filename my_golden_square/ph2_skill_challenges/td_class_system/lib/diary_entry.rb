# File: lib/diary_entry.rb
class DiaryEntry
  def initialize(title, contents) 
    @title = title
    @contents = contents
    @current_reading_index = 0
    @words = @contents.split(" ")
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return 0 if @contents.empty?
    return @contents.count(" ") +1
  end

  def reading_time(wpm) 
    fail "Error: wpm is not valid entry" unless wpm.positive?
    time_to_read = ((@contents.split(" ").length).to_f / wpm).ceil
    return time_to_read
  end

  def reading_chunk(wpm, minutes) 
    num_words_we_can_read = wpm * minutes
    start_from = @current_reading_index
    end_at = @current_reading_index += num_words_we_can_read
    word_list = @words[start_from...end_at]
    if end_at >= count_words 
      @current_reading_index = 0
    else
      @current_reading_index = end_at
    end
    return word_list.join(" ")
  end
end