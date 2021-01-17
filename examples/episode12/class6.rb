class Plant
  attr_reader :species, :invasive

  def initialize(species, invasive)
    @species = species
    @invasive = invasive
  end
end

subject1 = Plant.new('cactus', false)
subject2 = Plant.new('daisy', true)

puts subject1.species
puts subject2.species
puts subject1.invasive
puts subject2.invasive
