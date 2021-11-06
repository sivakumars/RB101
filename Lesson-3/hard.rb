puts("*****  Question 1 *********")
if false
  greeting = "hello world"
end

p greeting 
# output is nil , because 'if..end' construct doesn't create a scope, therefore greeting is assigned nil while being parsed,
# and when the code (if block) is executed and evaluates to false, greeting is NOT initialized to Hello world, so the output is nil.

puts("*****  Question 2 *********")
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings  # {a: 'hi there'}
#informal greeting is pointing to the string object referenced by the key :a in the greetings hash object.
# << method on informal greeting is mutating method, therefore the mutation is reflected in the hash object as well.

puts("********** Question 3 *********")
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #two
puts "two is: #{two}" #three
puts "three is: #{three}" #one

# gsub! is a mutating method , so it(gsub!) alters/mutates the object pointed to by parameters - one, two , three 
# inside the mess_with_vars method. As a consequence, the outer variables reflect this mutation.
# if gsub (no ! after the method) is used, there would be no effect on the object pointed to by the outer variables.
# since gsub returns a new object without mutating the caller.

puts("***** Question 4 **********")
def is_an_ip_number?(word)
  word.to_i >= 0 && word.to_i <=255
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end

p dot_separated_ip_address?("192.0.0.1")
p dot_separated_ip_address?("300.19.23.120")
p dot_separated_ip_address?("255.255.255.255")
p dot_separated_ip_address?("0.0.0.0")