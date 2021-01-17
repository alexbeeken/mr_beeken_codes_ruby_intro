class Person
  attr_reader :name, :hair_color

  def initialize(:name, :hair_color)
    @name = name
    @hair_color = hair_color
  end

  def ==(other_person)
    @name == other_person.name && @hair_color == other_person.hair_color
  end
end

sarah = Person.new(name: 'Sarah', hair_color: 'blonde')
sarah2 = Person.new(name: 'Sarah', hair_color: 'blonde')

sarah == sarah2
