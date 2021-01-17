def hello_message(name: 'alex', pronoun: 'he', emotion: 'happy')
  return "here is #{name}. #{pronoun} is/are feeling #{emotion}"
end

puts hello_message
puts hello_message(name: 'Mr. Beeken')
