Iterative methods with no side effects:
=======================================
each                                                 #=> returns the original collection  
each_with_index                                      #=> returns the original collection 
each_with_object (exception: there are side effects) #=> returns the object passed to the method as argument

selection/filter methods:
========================
select
reject
keep_if # => mutates the caller; returns a subset depending on the block's return value
take
slice
find_all  #= > works like select and returns an array. when used on hash, it still returns an array

Reduce methods:
==============
count
sum
any?
all?

Transformation methods:
======================
map
partition

string methods:
==============
upcase
downcase
swapcase
capitalize
#[]
chars
split
chr # => returns the first character
slice  # "siva".slice(0,3)  == "siva"[0,3]