puts("************** Question - 1 ****************")
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?("Spot")
#p ages.key?("Spot")
#p ages.member?("Spot")

###################################################
puts("************** Question - 2 ****************")

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase  
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

# no bang at the end of the method, so it returns a new string.

###################################################
puts("************** Question - 3 ****************")
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge(additional_ages)
###################################################
puts("************** Question - 4 ****************")
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("Dino")
#p advice.match?("Dino")

###################################################
puts("************** Question - 5 ****************")
flintstones =  %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

###################################################
puts("************** Question - 6 ****************")
flintstones =  %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

###################################################
puts("************** Question - 7 ****************")
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.concat(["Dino", "Hoppy"])

###################################################
puts("************** Question - 8 ****************")
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index("house"))  # => 0 to range =>  returns the string from index 0 to range - 1
p advice

###################################################
puts("************** Question - 9 ****************")
statement = "The Flintstones Rock!"
p statement.split("t").length - 1
#p statement.count("t")

###################################################
puts("************** Question - 10 ****************")
title = "Flintstone Family Members"
p title.center(40)