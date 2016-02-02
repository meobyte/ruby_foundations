# Ruby Foundations
Launch School Ruby Foundations: More Topics

# Blocks
## Closures
A closure is a chunk of code that binds artifacts (methods, variables, objects) in the surrounding scope. It builds and enclosure around these artifacts so they can be referenced when the closure gets executed.

## Passing Blocks to Methods
Blocks are created by adding them to the end of a method call. In the example below, ```each``` is the method call on the array object. The block begins with ```do``` and ends with ```end```.

``` ruby
[1, 2, 3].each do
  puts "I'm from inside the block"
end
```

If you were to add some local variables around that block, the block creates and enclosure around them.

``` ruby
result = ""
[1, 2, 3].each do
  result << "I'm from inside the block "
end
puts result
```

## Methods that take Blocks
All methods can take an optional block, though the method might not do anything with it. Using ```yield``` is one way to invoke
a block that has been passed in.

``` ruby
def hello
  yield if block_given?
end

hello do
  puts "Hello from the block"
end
```
### Yield with an argument
An argument to the block (between the ||) becomes the block local variable.
``` ruby
def hello
  yield("Earth") if block_given?
end

hello do |planet|
  puts "Hello #{planet}!"
end
```

Code blocks always return a value. It will return the last statement if there is no explicit return.


