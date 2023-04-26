#students = [
 # {name: "Dr. Hannibal Lecter", cohort: :november},
  #{name: "Darth Vader", cohort: :november},
  #{name: "Nurse Ratched", cohort: :november},
  #{name: "Michael Corleone", cohort: :november},
  #{name: "Alex DeLarge", cohort: :november},
  #{name: "The Wicked Witch of the West", cohort: :november},
  #{name: "Terminator", cohort: :november},
  #{name: "Freddy Krueger", cohort: :november},
  #{name: "The Joker", cohort: :november},
  #{name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
#]
@students = []

def student_input
  months = [:january, :february, :march,:april, :may, :june, :july, :august, :september, :october, :november, :december]
 # create an ampty array
  puts "Please enter the names of the students"
  puts "To finish, leave the name blank and press enter"
# ask for user input on name
  name = gets.strip
# while the name is not empty, repeat this code
  while !name.empty? do
    name = name.capitalize!
# ask what cohort it is. Cohort is set to January if input left empty 
    puts "Whtat is the cohort? Note, it will be set to January as default"
    cohort = gets.chomp.downcase.to_sym
    if months.include?(cohort)
      cohort = cohort.capitalize
    else
      cohort = "January"
    end
    puts "And the hobby?"
    hobby = gets.chomp
    
    @students << {name: name, cohort: cohort, hobbies: hobby}
    puts "Now we have #{@students.count} students"
    # get anohter name from the user
    puts "Please enter next student"
    name = gets.chomp
  end
  # this method creats the list of students, no need to return it becasue students[] is declared outside of all methods. 
end

def print_header
  puts "The students of Villains Academy".center(CENTER_SPACE)
  puts "-------------".center(CENTER_SPACE)
end

def print_students_list
# while loop is printing student names while count is not equal number of students
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort). #{student[:name]}'s favorite hobby is #{student[:hobbies]}".center(CENTER_SPACE)
  end
end

def print_footer
  student_grammar = "student"
  if @students.length < 2
    student_grammar = "student"
  else
    student_grammar = "students"
  end
  puts "Overall, we have #{@students.count} great #{student_grammar}.".center(CENTER_SPACE)
end

def interactive_menu
  # show user the list of sctins and get input
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1" 
     student_input
    when "2" 
      print_header
      print_students_list
      print_footer
    when "9" 
      exit
      else 
      puts "I don't know what you meant, try again"
  end
end

CENTER_SPACE = 60
interactive_menu
#students = student_input
#print_header
#print(students)
#print_footer(students)