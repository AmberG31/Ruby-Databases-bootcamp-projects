def task_tracker(text)
  fail "Error: empty string." unless !text.empty?
  
  if text.include?("#TODO")
    return true
  elsif text.include?("#TODO") == false
    return false
  end
end