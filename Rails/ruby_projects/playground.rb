puts "Hello please enter your first name"
first_name = gets.chomp
puts "Please enter your last_name"
last_name = gets.chomp
full_name = first_name + " " + last_name
puts "Welcome to the analyzer program #{full_name}"
puts "Your first name has #{first_name.length} characters in it"
puts "Your last name has #{last_name.length} characters in it"
puts "Your name in reverse is #{full_name.reverse}"
