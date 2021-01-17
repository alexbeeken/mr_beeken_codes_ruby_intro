class Plant
  attr_reader :species, :invasive

  def initialize(species, invasive)
    @species = species
    @invasive = invasive
  end

  def native?
    return !invasive
  end

  def self.instructions
    return "To create a plant simply provide the species and indicate whether it’s native or invasive!"
  end

  private

  def is_cactus?
    @species == 'cactus'
  end
end

puts Plant.instructions
