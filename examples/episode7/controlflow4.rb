def check_num(number)
  if (number > 6 && number < 9)
    puts "yes!"
  end

  if !(number > 6 && number < 9)
    puts "no!"
  end
end

check_num(3)
check_num(7)
