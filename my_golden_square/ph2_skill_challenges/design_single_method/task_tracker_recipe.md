# {{PROBLEM}} Method Design Recipe

## 1. Describe the problem

> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO.


## 2. Design the method signature

```ruby
text_result = test_checker(text)
# "text will" be given as a string
# "test_checker" checks if a text includes the string #TODO
# text_result will return a boolean

```

## 3. Create examples as tests

```ruby
test_checker("")
# => "Error: empty string."
test_checker("#TODO")
# => true
test_checker("Some text")
# # => false

```

## 4. Implement the behaviour

WRITE CODE!