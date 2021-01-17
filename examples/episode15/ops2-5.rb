class String
  def +(other)
    return "#{self}#{other.to_s}"
  end
end

puts "hello " + 5
