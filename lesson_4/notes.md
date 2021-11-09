Quiz notes:
----------

`each` method need not execute  the block passed to it for every element in the collection.
If the block mutates the original collection on which  `each` method is called, then it might not 
iterate as many times as the number of elements in the collection

`find_all` method acts like  `select` method but returns an array even on hash objects

`select` and `map` methods return a new array and it may contain the same values as the orignal array