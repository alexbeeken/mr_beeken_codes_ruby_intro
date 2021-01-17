def hello_message(arguments = {})
  name = arguments[:name] || 'alex'
  pronoun = arguments[:pronoun]  || 'he'
  emotion = arguments[:emotion]  || 'happy'

  return "here is #{name}. #{pronoun} is/are feeling #{emotion}"
end

puts hello_message
puts hello_message({ name: 'Mr. Beeken' })
