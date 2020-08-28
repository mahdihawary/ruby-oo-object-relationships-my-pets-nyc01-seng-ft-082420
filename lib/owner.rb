class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all<<self
  end
  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end
  def self.count
    @@all.size
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select{|c| c.owner == self}
  end
  def dogs
    Dog.all.select{|d| d.owner == self}
  end
  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    pets = self.dogs + self.cats

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end