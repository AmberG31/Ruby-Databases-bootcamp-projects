class DiaryEntry
  def initialize(title, content) # title and content are both strings
    @title = title
    @content = content
    @phone_numbers = []
  end

  def title
    return @title
  end
  
  def content
    return @content
  end
  
  def count_words
    return @content.split(" ").length
  end
  
  def reading_time(wpm)  
    (count_words.to_f / wpm).ceil
  end
  
  def show_numbers
    number = @content.scan(/(0[1-6][0-9]{8,10}|07[0-9]{9})/)
    number.map { |num| @phone_numbers << num[0] }
    return @phone_numbers
  end
end