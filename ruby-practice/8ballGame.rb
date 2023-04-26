# Write a program that acts like a magic 8 ball.  It should randomly choose one of five predictions and „puts“ the prediction it chose
#   * `It is certain`
#   * `It is decidedly so`
#   * `Ask again later`
#   * `Outlook not so good`
#   * `Very doubtful`
case rand(4)
  when 0 then puts "It is certain"
  when 1 then puts "It is decidedly so"
  when 2 then puts "Ask again later"
  when 3 then puts "Outlook not so good"
  when 4 then puts "Very doubtful"
end 
