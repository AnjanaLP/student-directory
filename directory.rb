def input_students
  students = []
  while true do
    months = [:january, :february, :march, :april, :may, :june, :july, :august, :september,
    :october, :november, :december]
    puts "Enter the name of the student, enter 'quit' to finish"
    name = gets.chomp
      if name.empty?
        name = "Unknown"
      elsif name == "quit"
        break
      elsif name == "back"
        redo
      end
    puts "Enter their cohort or enter 'back' to amend their name"
    cohort = gets.chomp.downcase.to_sym
      if cohort.empty?
        cohort = :Unknown
      elsif cohort == :back
        redo
      elsif !months.include?(cohort)
        puts "You entered an invalid month, please re-enter this student's info"
        redo
      end
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length
    puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
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
