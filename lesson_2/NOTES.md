# Things to review

## Class and Instance Methods

What is the difference between `Class` and `Instance` methods.

**Class** Methods are called on classes.

Example:

```ruby
Class User
# ...
end

richard = User.where(:name => 'richard').first
```

**Instance** Methods are called objects.

Example:

```ruby
richard.name
# => "richard"
```

Instances are created with the `new` method.

```ruby
User.new(...)
```

_How do you know when to use one vs. the other?_

- https://www.youtube.com/watch?v=QUgJsZz1-dg
- https://www.youtube.com/watch?v=i4uiyWA8eFk
