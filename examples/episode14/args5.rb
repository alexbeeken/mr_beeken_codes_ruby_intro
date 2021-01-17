def show_info(object)
  if object.kind_of? Integer
    "the person is #{object.to_s} years old"
  elsif object.kind_of? String
    "their name is #{object}."
  end
end

puts show_info(32)
puts show_info("Alex")
