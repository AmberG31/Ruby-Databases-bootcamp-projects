class GrammarStats
  def initialize
    @good_text = 0
    @checked = 0
  end

  def check(text) 
    fail "Error: stirng is empty." unless !text.empty?
    if text[0] == text[0].upcase and [".", "?", "!"].include? text[-1]
      @good_text += 1
      @checked += 1
      return true
    else
      @checked += 1
      return false
    end
  end

  def percentage_good
    return "No texts have been passed" if @checked == 0
    percentage = (@good_text.to_f / @checked.to_f) * 100
    return "#{percentage.to_i}% has passed so far"
  end
  
end
