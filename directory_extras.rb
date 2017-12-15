@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit # this will cause the program to terminate
    else puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
  puts "Student input successful"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter the filename where you want to save your students"
  user_input = STDIN.gets.chomp
  user_input.empty? ? filename = "students.csv" : filename = user_input
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Your input has been saved."
end

def load_students(filename = "")
  if filename.empty?
    puts "Enter the filename you would like to load from"
    user_input = STDIN.gets.chomp
    user_input.empty? ? filename = "students.csv" : filename = user_input
  end
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  filename = "students.csv" if filename.nil?
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
