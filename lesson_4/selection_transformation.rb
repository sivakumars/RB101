def select_fruit(fruit_hash)
  return nil if fruit_hash.size == 0

  selected_fruits = {}
  fruit_hash.each do |key, value|
    selected_fruits[key] = value if value == 'Fruit'
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
puts "**************************************************************"

def double_numbers_odd_indices!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2 if counter.odd?

    counter += 1
  end

  numbers
end

def double_numbers_odd_indices(numbers)
  double_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter] 
    current_number *= 2 if counter.odd?
    double_numbers << current_number

    counter += 1
  end

  double_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p "Original object (my_numbers) values             :#{my_numbers}"
p "Original object(id) before using MUTATING METHOD: #{my_numbers.object_id}"
doubled_numbers =  double_numbers_odd_indices!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p "       --AFTER USING MUTATING METHOD --       "
p "Original object (my_numbers) values             : #{my_numbers}"
p "Result object (doubled_numbers) values          : #{doubled_numbers}"
p "Original object(id) after using MUTATING METHOD : #{my_numbers.object_id}"
p "Result object(id) using MUTATING METHOD         : #{doubled_numbers.object_id}"
puts "**************************************************************"
my_numbers = [1, 3, 5, 7, 9, 10]
p "Original object (my_numbers) values                  : #{my_numbers}"
p "Original object(id) before using NON-MUTATING METHOD : #{my_numbers.object_id}"
doubled_numbers =  double_numbers_odd_indices(my_numbers) # => [2, 8, 6, 14, 4, 12]
p "       --AFTER USING NON-MUTATING METHOD--       "
p "Original object (my_numbers) values                  : #{my_numbers}"
p "Result object (doubled_numbers) values               : #{doubled_numbers}"
p "Original object(id) after using NON-MUTATING METHOD  : #{my_numbers.object_id}"
p "Result object(id) using NON-MUTATING METHOD          : #{doubled_numbers.object_id}"

puts "*********** NON-MUTATING Multiply method *********************"

def multiply(numbers, factor)
  multiplied_numbers = []
  counter = 0
  loop do
    break if counter == numbers.size

    multiplied_numbers[counter] = numbers[counter] * factor

    counter += 1
  end
  multiplied_numbers
end

numbers = [1,2,3,4,5]

p "Original object values                 : #{numbers}"
p "Original object values multiplied by 3 : #{multiply(numbers, 3)}"
p "Original object values multiplied by 5 : #{multiply(numbers, 5)}"
p "Original object values multiplied by 10: #{multiply(numbers, 10)}"