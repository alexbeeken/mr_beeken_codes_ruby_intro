module NameHelpers
  def display_name
    @name.capitalize
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
