# Pseudocode Exercises

| Keyword	meaning  | START	start of the program |
| :---             | :---                        |
| SET | 	sets a variable we can use for later | 
| GET | 	retrieve input from user |
| PRINT | 	displays output to user | 
| READ | 	retrieve value from variable | 
| IF / ELSE IF / ELSE	| show conditional branches in logic | 
| WHILE | 	show looping logic |
| END | 	end of the program |

----

## Exercises

### A method that returns the sum of two integers

```
DEFINE a method that takes two integers or floats as arguments
ADD the two arguments together
PRINT the sum
```

```ruby
def add(num1, num2)
  num1 + num2
end
```

----

### A method that takes an array of strings, and returns a string that is all those strings concatenated together

```
DEFINE a method that takes an array of strings as an argument
COMBINE all the strings in the array together
PRINT the joined string
```

```ruby
def join_strings(arr)
  arr.join
end
```

---

### A method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:

```
DEFINE a method that takes an array of integers as an argument
LOOP trough the array, and get the index of each element
IF the index is even
  THEN return the number
PRINT the new array
```

```ruby
a = [5, 9, 3, 11]

def everyOther(arr)
  arr.each_with_index.map { |num, index| index.even? ? num : nil }.compact
end

p everyOther(a)
```

---

### A method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

```
DEFINE a method that takes a string of characters and the single character to find as arguments
SPLIT the string into an array of characters
ITERATE trough the array, and get the index of each character
IF the index is equal to the character, 
  THEN return the index
PRINT the index
```

```ruby
def third_occurence(string, expected)
  arr = string.split('')
  count = 0
  final_index = 0
  arr.each_with_index.map do |v,i|
    count += 1 if v == expected
    final_index = i if count == 3
  end
  final_index
end

puts third_occurence('aabc99ibab', 'b')
```
---

### A method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should becoome the elements at the odd indexes. For instance:

```
DEFINE a method that takes two arrays
MERGE the arrays into a single array
PRINT the Results
```

```ruby
def merge(arr1, arr2)
  arr1.concat(arr2)
end

a1 = [1,2,3,4]
a2 = [5,6,7,8]

p merge(a1, a2)
```
