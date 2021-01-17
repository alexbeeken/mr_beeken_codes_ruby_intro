class Person
  attr_reader :name, :hair_color

  def initialize(name:, hair_color:)
    @name = name
    @hair_color = hair_color
  end
end

sarah = Person.new(name: 'Sarah', hair_color: 'blonde')

puts sarah.name
