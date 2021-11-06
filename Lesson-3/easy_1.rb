# Question - 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers  

#  outputs
1
2
2
3
=begin
Reason: uniq is a non-destructive method and it returns a new array which is not 
        stored in any variable, so the original numbers array is displayed. 
        Puts displays each of the array items in a new line
=end 
######################################################
=begin
Question - 2

1. what is != and where should you use it?
  != is not equal to operator, and it is used to compare inequalities of  two values

2. put ! before something, like !user_name
  The ! operator reverses the 'truthy or falsy' nature of the object that follows it.
  !"siva"  => returns false; !nil => returns true;  !(5 == 5)  => returns false

3.put ! after something, like words.uniq!
  The ! operator after the method indicates that the method is destructive. That is, the method
  mutates the values of the caller (the object that calls the method)

4.put ? before something
  It is used for ternary operators to check a boolean condition.

5.put ? after something
  If a method returns true or false

6. put !! before something, like !!user_name
  <It is used to check for the not false condition. !!username =>  if username is not invalid >
  It is used to convert the object to its boolean equivalent. 
 
=end
######################################################
# Question - 3

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.gsub!("important", "urgent")
######################################################
# Question - 4

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)  # => [1,3,4,5]  deletes the item at index 1
p numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)  #=> [2,3,4,5] deletes the item with value 1
p numbers

######################################################
# Question - 5
p (42 in (10..100))
p (10..100).cover?(42)
p (10..100).include?(42)

######################################################
# Question - 6

famous_words = "seven years ago..."

p "Four score and " << famous_words
p "Four score and "+ famous_words
p famous_words.prepend("Four score and ")

######################################################
# Question - 7

array = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
p array
p array.flatten

######################################################
# Question - 8

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.to_a.select { |array_object| array_object[0] == "Barney" }.flatten
p flintstones.assoc("Barney")