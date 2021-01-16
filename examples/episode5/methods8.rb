def random_number(max)
  return rand(max)
end

def add_random(number = 1)
  return number + random_number(number)
end

puts add_random
puts add_random(10)
