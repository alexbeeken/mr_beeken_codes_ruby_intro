def check_num(number)
  if (number > 8 && number < 10)
    puts "yes!"
  elsif (number == 12)
    puts "twelve!"
  else
    puts "no!"
  end
end

check_num(3)
check_num(12)
