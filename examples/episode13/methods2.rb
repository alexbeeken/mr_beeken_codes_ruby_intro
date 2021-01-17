class Plant
  attr_reader :species, :invasive

  def initialize(species, invasive)
    @species = species
    @invasive = invasive
  end

  def native?
    return !invasive
  end
end

subject1 = Plant.new('cactus', false)
subject2 = Plant.new('daisy', true)

puts subject1.native?
puts subject2.native?
