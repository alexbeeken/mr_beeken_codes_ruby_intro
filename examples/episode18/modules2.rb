module NameHelpers
  def display_name
    first_letter = @name[0].upcase!
    rest = @name[1..-1]

    "#{first_letter}#{rest}"
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

puts Plant.new('cactus', 'steve').display_name
puts Planet.new('medium', 'mars').display_name
