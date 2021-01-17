def hello_message(arguments)
  name = arguments[:name]
  pronoun = arguments[:pronoun]
  emotion = arguments[:emotion]

  return "here is #{name}. #{pronoun} is/are feeling #{emotion}"
end

puts hello_message({
  name: 'alex',
  pronoun: 'he',
  emotion: 'happy'
})
