puts('***************** Question-1 *****************')
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index { |name, index| flintstones_hash[name] = index}
p flintstones_hash

puts('***************** Question-2 *****************')
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.sum

# total_age = 0
# ages.values.each {|age| total_age += age}
# p total_age

puts('***************** Question-3 *****************')
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts "Ages hash:  #{ages}"
puts "Select under 100: #{ages.select {|name, age| age < 100}}"  # => NON-MUTATING | select returns K,V pairs for which the block returns true
puts "Reject over 100: #{ages.reject {|name, age| age >= 100 }}" # => NON-MUTATIING | reject returns K, V pairs for which the block returns false

puts "Reject over 100: #{ages.reject! {|name, age| age >= 100 }}" # => MUTATIING | reject returns K, V pairs for which the block returns false
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 } # => reinitializing because the previous method is mutating
puts "Keep under 100: #{ages.keep_if {|name, age| age > 100}}"   # => MUTATING | keep_if method returns K, V pairs for which the block returns true

puts('***************** Question-4 *****************')
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

puts('***************** Question-5 *****************')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

be_index = nil
flintstones.each_with_index do |name, index|  
  # return index if name.start_with?('Be')# NOTE: returns from the main object: self - main
                                          # the block (nameless method) gets executed on the main object, so a return statement will return
                                          # the execution to outside the main object 
  if name.start_with?('Be')
    be_index = index
    break
  end 
end
p "Index of Betty: #{be_index}"  # => can't use p  with a method that takes a do block

p "Index of pebbles: #{flintstones.index {|name| name.start_with?('Pe')} }"

puts('***************** Question-6 *****************')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map { |name| name.slice(0,3)}

puts('***************** Question-7 *****************')
statement = "The Flintstones Rock"
p statement
frequency = statement.chars.each_with_object({}) do |character, frequency_hash|
  frequency_hash.has_key?(character) ? frequency_hash[character] += 1 : frequency_hash[character] = 1
end
p frequency

result = {}
statement.chars.each do |character|
  result[character] = statement.count(character) unless result.has_key?(character)
end
p result

puts('***************** Question-8 *****************')
# numbers = [1, 2, 3, 4]
# numbers.each_with_index do |number, index|
#   p "#{index}  #{numbers.inspect}  #{number}"
#   numbers = []
# end

def loop_each(numbers, &block)
  counter = 0
  loop do
    block.call("hello", numbers[counter])
    counter +=1
    break if counter == numbers.size
  end
  numbers
end

array = [1,2,3,4]
p loop_each(array) { |text, value| 
    puts "#{text} #{array} #{value}"
    array.shift(1)
    #array.pop(1)
    #array = []
}

puts('***************** Question-9 *****************')
words = "the flintstones rock"

def titilize(str)
  return nil if str.size == 0
  str.split.map {|word| word.capitalize }.join(' ')
end

p titilize(words)

puts('***************** Question-10 *****************')
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  age = details["age"]
  if (0..17).cover?(age) 
    details["age_group"] = "kid"
  elsif (18..64).cover?(age)
    details["age_group"] = "adult"
  elsif age >= 65
    details["age_group"] = "senior"
  end
end

p munsters
