puts "*************** Ruby implementation of each ************"
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  puts "#{index}  #{numbers.inspect}  #{number}"
  #numbers.shift(1)  # => shift is a mutating method
  #numbers.pop(1)    # => pop is a mutating method
  numbers = [2]      # => a new array object [2] is assigned to the numbers variable
end

##  NOTE:  Get back to this method when you study OOP

## In the following implementation, array and block are passed as an argument to the loop_each method
## The numbers(pointer to an <array> object) parameter of loop_each is locally scoped within the method (available only in loop_each)
## 'loop' method is executed inside loop_each for <numbers.size> times
## the block (passed as an argument to the loop_each) is executed for each loop iteration.
## #the block takes an element of the array(based on the counter value of loop) and "counter" as arguments
## #if the array object is changed (by a mutating method) inside the block, it(the numbers parameter) reflects inside the loop method
## #if the array object is changed (by reassignment) inside the block, it(numbers parameter) DOESN'T reflect inside the loop method
##     because the numbers parameter inside the loop_each method and the argument array  point to TWO DIFFERENT objects

# Question: Since we pass the argument to the method, it is locally scoped within the method,
#           What happens when the the method is invoked on the <array object>, how is it implemented?
#           self is assigned to a variable  and that variable is used inside the loop?  
#           self =[] , object = self,   loop .... end , self = [] (inside the block)

puts "*************** Experimental implementation of each  *********************"
def loop_each(numbers, &block)
  counter = 0
  loop do
    block.call(numbers[counter], counter)
    counter +=1
    break if counter == numbers.size
  end
  numbers
end

array = [1,2,3,4]
p loop_each(array) { |value, index| 
    puts "#{index}  #{array} #{value.inspect}"
    #array.shift(1)  # => shift is a mutating method
    #array.pop(1)    # => pop is a mutating method
    array = [2]      # => a new array object [1] is assigned to the array variable
}




