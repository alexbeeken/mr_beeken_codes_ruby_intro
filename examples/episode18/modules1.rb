class Plant
  def initialize(species, name)
    @species = species
    @name = name
  end

  def display_name
    @name.capialize
  end
end

class Planet
  def initialize(size, name)
    @size = size
    @name = name
  end

  def display_name
    @name.capialize
  end
end

puts Plant.new('cactus', 'steve').display_name
puts Planet.new('medium', 'mars').display_name
