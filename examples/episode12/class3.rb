class Plant
  def initialize(species)
    @species = species
  end
end

plant = Plant.new("cactus")

puts plant.species
