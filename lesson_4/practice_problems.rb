puts('**************** Question -1 ****************') 
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# returns [1,2,3]
puts('**************** Question -2 ****************') 
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# returns : 2
puts('**************** Question -3 ****************') 
[1, 2, 3].reject do |num|
  puts num
end

#returns : [1,2,3]
puts('**************** Question -4 ****************') 
hash = {}  # => NOTE: wrong choice of variable name: variable shadowing in the block
['ant', 'bear', 'cat'].each_with_object(hash) do |value, hash|
  hash[value[0]] = value
end

p hash
# returns: {"a" => "ant", "b" => "bear", "c" => "cat"}
puts('**************** Question -5 ****************') 
hash = { a: 'ant', b: 'bear' }
hash.shift  # => doesn't accept any arguments

#returns : [[:a, 'ant']]
puts('**************** Question -6 ****************') 
['ant', 'bear', 'caterpillar'].pop.size

# returns: 11
puts('**************** Question -7 ****************') 
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# 1. block's return value num.odd? => returns if num is odd
# 2. any? return value is true, because 1 in [1,2,3] is odd and any? will return true if the block returns true
#    for atleast one element
puts('**************** Question -8 ****************') 
arr = [1, 2, 3, 4, 5]
arr.take(2)  # arr.take(0) => [] ;  arr.take(19) ==> [1,2,3,4,5]

# returns an array of the first 'n' elements in the original object (caller)
puts('**************** Question -9 ****************') 
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

#returns: [nil, 'bear']
puts('**************** Question -10 ****************') 
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# returns: [1, nil, nil]
