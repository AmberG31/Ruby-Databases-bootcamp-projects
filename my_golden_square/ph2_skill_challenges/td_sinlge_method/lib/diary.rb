def make_snippet(str)
  words = str.split
  first_5_words = words[0..4].join(" ")
  
  if words.length > 5
    return "#{first_5_words} ..."
  else
    return first_5_words
  end
end