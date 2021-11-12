Quiz notes:
----------

1. `each` method need not execute  the block passed to it for every element in the collection.
  If the block mutates the original collection on which  `each` method is called, then it might not 
  iterate as many times as the number of elements in the collection.

2. `find_all` method acts like  `select` method but returns an array even on hash objects.

3. `select` and `reject` methods return a new array and it may contain the same values as the orignal array
    depending on the return value of the block(return value of the block is determined the select/reject criteria).

4. `map` method is used to transform the elements of an array. The transformed element is determined by the return 
    value of the block
