class Plant
  def self.grows?
    true
  end

  def self.energy_source
    'sun, water and soil.'
  end
end

class Animal
  def self.grows?
    true
  end

  def self.energy_source
    'water, plants, other animals'
  end
end

puts Plant.energy_source
puts Animal.energy_source
puts Plant.grows?
puts Animal.grows?
