class Plant
  def initialize(species)
    @species = species
  end

  def species
    return @species
  end
end

subject1 = Plant.new('cactus')
subject2 = Plant.new('daisy')

puts subject1.species
puts subject1.species
