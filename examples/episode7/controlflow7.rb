def check_num
  if (number > 8 && number < 10) do
    puts "yes!"
  elsif (number == 12) do
    puts "twelve!"
  else
    puts "no!"
end

check_num(3)
check_num(12)
