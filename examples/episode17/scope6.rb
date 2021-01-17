number = nil

5.times do
  number = number || 1

  puts number

  number += 1
end
