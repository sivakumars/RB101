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