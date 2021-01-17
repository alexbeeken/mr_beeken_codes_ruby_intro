module NameHelpers
  def display_name
    first_letter = @name[0].upcase!
    rest = @name[1..-1]

    "#{first_letter}#{rest}"
  end

  def self.has_a_name? 
    true
  end
end

class Plant
  include NameHelpers

  def initialize(species, name)
    @species = species
    @name = name
  end
end

class Planet
  include NameHelpers

  def initialize(size, name)
    @size = size
    @name = name
  end
end

puts Plant.has_a_name?
puts Planet.has_a_name?
