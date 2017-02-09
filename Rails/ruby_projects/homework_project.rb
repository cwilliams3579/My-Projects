dial_book = {
  "New York" => "10001",
  "Dallas" => "75211",
  "Miami" => "33101",
  "Orlando" => "32801",
  "Atlanta" => "30301",
  "Virginia" => "23450",
  "Maryland" => "20724",
  "Irving" => "75014",
  "Grand Prairie" => "75050",
  "Richardson" => "75081"
}

# method to display city names
# method to get area code, dial book and the city name
def get_city_name(somehash)
  somehash.each { |k, v| puts k }
end

def get_area_code(somehash, key)
  somehash[key]
end

loop do
  puts "Do you want to lookup a city name?(Y/N)"

  answer = gets.chomp
  if answer != "Y"
    break
  end
  puts "Which city do you want to get the area code?"
  get_city_name(dial_book)
  prompt = gets.chomp

  if dial_book.include?(prompt)
    puts "The area code for #{prompt} is #{get_area_code(dial_book, prompt)}"
  else
    puts "You entered a city name that is not in the address book"
  end
end
