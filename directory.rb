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
      if students.length == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  sorted_by_cohort = {}
  students.each do |student|
      cohort = student[:cohort]
      name = student[:name]
      if sorted_by_cohort[cohort] == nil
         sorted_by_cohort[cohort] = []
      end
      sorted_by_cohort[cohort] << name.capitalize
  end

  sorted_by_cohort.each do |month, names|
    puts "#{month.capitalize}: #{names.join(", ")}"
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
