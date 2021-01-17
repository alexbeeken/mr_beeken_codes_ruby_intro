class LivingThing
  def self.grows?
    true
  end
end

class Plant < LivingThing
  def self.energy_source
    'sun, water and soil.'
  end
end

class Animal < LivingThing
  def self.energy_source
    'water, plants, other animals'
  end
end

puts Plant.superclass
