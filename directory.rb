def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Enter their hobbies"
    hobbies = gets.chomp
    puts "Enter their country of birth"
    country = gets.chomp
    puts "Enter their height"
    height = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height }
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter the name of your next student"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length
    puts "#{students[i][:name]}, #{students[i][:height]} in height, born in #{students[i][:country]}, hobbies include #{students[i][:hobbies]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
