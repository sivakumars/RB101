puts("************* Question 1 *************")
10.times { |index| puts((" " * index) + "The Flintsones Rock!") }

puts("************* Question 2 *************")
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40+2}"


puts("************* Question 3 *************")
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << divisor if number % divisor == 0
    divisor -= 1
  end
  factors.reverse
end

p factors(10)

puts("************* Question 4 *************")

# the buffer parameter is modified or mutated because << is a mutating method
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# the buffer parameter is unmodified  because + is a non-mutating method  and returns a new buffer array
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

puts("************* Question 5 *************")
def fib(first_num, second_num, limit = 15)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 20)
puts "result is #{result}"

puts("************* Question 6 *************")
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # the parameter in the method is assigned a new value 42+8 . The original parameter is immutable and stays 42

puts("************* Question 7 *************")
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    print "#{family_member.object_id} "
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
p "#{munsters["Herman"].object_id}
   #{munsters["Lily"].object_id}
   #{munsters["Grandpa"].object_id}
   #{munsters["Eddie"].object_id}
   #{munsters["Marilyn"].object_id}"

# The data of the munsters hash object changes, because in the mess_with_demographics method, the demo_hash points 
# to the same munsters object without getting replaced or reassigned. The values of each key is reassigned though.

puts("************* Question 8 *************")
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

p rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # paper


puts("************* Question 9 *************")
#foo = "no"
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)  # no   the foo method expression gets evaluated first before being passed to bar method