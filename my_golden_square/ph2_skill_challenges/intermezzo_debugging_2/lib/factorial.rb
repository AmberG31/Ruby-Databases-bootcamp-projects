def factorial(n)
  product = 1
  while n > 0
    # binding.irb # Mystery new line!
    product *= n # change product with n places from line 5 to line 6 
    n -= 1
    
  end
  product
end

p factorial(5)