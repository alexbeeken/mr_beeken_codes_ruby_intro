class Plant
  def initialize(species)
    @species = species
  end

  def info
    "This is a member of the species: #{@species}"
  end
end


puts Plant.new('cactus').info
