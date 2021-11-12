
puts '*************** Question -1 **************'
arr = ['10', '11', '9', '7', '8']
p arr.sort_by {|number_str| number_str.to_i }


puts '*************** Question -2 **************'
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p books.sort_by {|book| book[:published].to_i}


puts '*************** Question -3 **************'
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p "arr1: #{arr1[2][1][3]}"

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p "arr2: #{arr2[1][:third][0]}"

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p "arr3: #{arr3[2][:third][0][0]}"

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p "hsh1: #{hsh1['b'].last}"

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p "hsh2: #{hsh2[:third].key(0)}"

puts '*************** Question -4 **************'
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p "arr1 : #{arr1}"

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p "arr2 : #{arr2}"

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p "hsh1  : #{hsh1}"

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p "hsh2 : #{hsh2}"

puts '*************** Question -5 **************'
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

reduced_val = munsters.reduce(0) do |total_age, munster|
  munster[1]['gender'] == 'male' ? total_age += munster[1]['age'] : total_age
end
p "reduced value: #{reduced_val}"

total_age = 0
munsters.each {|name, details| total_age += details['age'] if details['gender'] == 'male'}
p "total age with each: #{total_age}"

puts '*************** Question -6 **************'
munsters.each do |name,details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}"
end

puts '*************** Question -7 **************'
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a = 2; b = [3,8]

puts '*************** Question -8 **************'
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, arr_object| 
  puts "For key: #{key}"
  vowels = []
  arr_object.each do |string| 
    string.chars.each do |letter|
      if 'aeiou'.include?(letter)
        vowels << letter
      end
    end
  end
  puts "Vowels : #{vowels}"
end

puts '*************** Question -9 **************'
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
internal_sort  = arr.map do |sub_arr| 
  sub_arr.sort {|first_el, second_el| second_el <=> first_el }
end
p internal_sort

puts '*************** Question -10 **************'
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
transformed_arr =  arr.map do |hash|
  transformed_hash_obj = {}
  hash.each do |key, value|
    transformed_hash_obj[key] = value + 1
  end
  transformed_hash_obj
end
p "transformed array: #{transformed_arr}"

puts '*************** Question -11 **************'
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
new_arr = arr.map do |sub_arr| 
  sub_arr.select {|item| item % 3 == 0 }
end
p "Only multiples of 3: #{new_arr}"

puts '*************** Question -12 **************'
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hash = arr.each_with_object({}) do |sub_arr, hash_object|
  hash_object[sub_arr[0]] = sub_arr[1]
end

puts "Hash object: #{hash}"

puts '*************** Question -13 **************'
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
sorted_arr = arr.sort_by do |sub_arr|
  sub_arr.select {|item| item.odd? }
end
puts "Sorted array: #{sorted_arr}"

puts '*************** Question -14 **************'
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result_arr = hsh.map do |item, details|
  case details[:type]
  when 'fruit'
    details[:colors].map {|color| color.capitalize}
  when 'vegetable'
    details[:size].upcase
  end
end

puts "Transformed values: #{result_arr}"

puts '*************** Question -15 **************'
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
filtered_arr = arr.select do |hash_object|
  hash_object.all? do |key, value|
    value.all? {|num| num.even? }
  end
end

puts "Filtered array using select: #{filtered_arr}"

filtered_arr = arr.reject do |hash_object|
  hash_object.any? do |key, value|
    value.any? {|item| item.odd? }
  end
end

puts "Filtered array using reject: #{filtered_arr}"

puts '*************** Question -16 **************'
#problem: generate UUID number - 32 hexadecimal characters with five sections of lengths 8-4-4-4-12

def generate_uuid
  hexadecimal_chars = (0..9).map {|el| el.to_s } + ('a'..'f').to_a
  sections_length = [8,4,4,4,12]

  uuid_str = sections_length.each_with_object([]) do |section_length, uuid|
    hexadecimal_digits = ""
    section_length.times do |_|
      hexadecimal_digits << hexadecimal_chars.sample
    end
    uuid << hexadecimal_digits
  end

  uuid_str.join('-')
end

puts generate_uuid
