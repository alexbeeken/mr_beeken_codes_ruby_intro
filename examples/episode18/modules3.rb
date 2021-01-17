module NameHelpers
  def display_name
    @name.capitalize
  end

  def self.included(base) 
    base.class_eval do
      def self.has_a_name?
        true
      end
    end
  end
end

class Plant
  include NameHelpers

  def initialize(species, name)
    @species = species
    @name = name
  end
end

class Planet
  include NameHelpers

  def initialize(size, name)
    @size = size
    @name = name
  end
end

puts Plant.has_a_name?
puts Planet.has_a_name?
