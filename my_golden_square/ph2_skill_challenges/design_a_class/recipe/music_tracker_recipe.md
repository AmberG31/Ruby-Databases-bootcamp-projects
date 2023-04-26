# Single-Class Programs Design Recipe
 
## 1. Describe the Problem
 
> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.


## 2. Design the Class Interface

``` ruby

class MusicTracker
  def initialize 
    # @songs - will be an empty array
  end

  def add(song) # passed as a string
    # added to an empty array
  end

  def list(song)
    # returns the list of songs
  end
end
```

## 3. Create Examples as Tests

> These are examples of the class being used with different initializer
> arguments, method calls, and how it should behave.

```
ruby

# 1
song1 = MusicTracker.new
song1.add("")
song1.list # => ""

# 2
song1 = MusicTracker.new
song1.add("Weekend")
song1.list # => "Weekend"

# 3 
song1 = MusicTracker.new
song1.add("Weekend")
song1.add("I fly")
song1.list # => "Weekend, I fly"

```

 
## 4. Implement the Behaviour

> For each example you create as a test, implement the behaviour that allows the
> class to behave according to your example.