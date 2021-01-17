class Plant
  def initialize(species, invasive)
    @species = species
    @invasive = invasive
  end

  def species
    return @species
  end

  def invasive
    return  @invasive
  end
end

subject1 = Plant.new('cactus', false)
subject2 = Plant.new('daisy', true)

puts subject1.species
puts subject2.species
puts subject1.invasive
puts subject2.invasive
