class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts "Hello. I will repeat a string many times."
    @terminal.puts "Please enter a string"
    string = @terminal.gets "TWIX"
    @terminal.puts "Please enter a number of repeats"
    number_of_times = @terminal.gets "10"
    @terminal.puts "Here is your result:"
    #result = string_repeat(string, number_of_times)
    @terminal.puts string * number_of_times.to_i
  end

  # private

  # def string_repeat(string, number_of_times)
  #   number_of_times.to_i.times { print string }
  #   p "here we are:"
  #   p string
  #   p number_of_times
  # end


end