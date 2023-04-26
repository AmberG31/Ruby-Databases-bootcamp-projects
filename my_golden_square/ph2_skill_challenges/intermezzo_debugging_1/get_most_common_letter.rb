def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    if char.match? /[a-zA-Z]/ # add regular expression to get rid of punctuation and spaces
      counter[char] += 1
    end
  end
    counter.to_a.sort_by { |k, v| v }[-1][0] # arrays is sorted descending, we are grabbing the second character.
end

puts get_most_common_letter("the roof, the roof, the roof is on fire!")

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
