class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(0) # changed the argument from 1 to 0
    most_common = nil
    most_common_count = 1
    @text.chars.each do |char|
      next unless is_letter?(char)
      #binding.irb
      counter[char] = (counter[char] || 1) +1 # counter[char] = 2
       # binding.irb
      if counter[char] > most_common_count # counter[char] is 2 and most_common_count is 1
        #binding.irb
        most_common = char # char is i, most common is i
        most_common_count = counter[char] #most_common_count is 1 and counter[char] is 2. I removed the +
      end
    end
    #binding.irb
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    # binding.irb
    return letter =~ /[a-z]/i # this is returning "D". After changing line 18 it is returning i as exected 
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]

# output 1 = [3, "D"]
# output 2 = [3, "i"]