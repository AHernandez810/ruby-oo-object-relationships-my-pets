require 'pry'

class Owner

 attr_reader :name, :species
 @@all = []

 def initialize(name, species = "human")
  @name = name
  @species = species
  @@all << self
 end


 def say_species
  "I am a #{@species}."
 end

def cats
  Cat.all.select {|cats| cats.owner == self}
end

def dogs
  Dog.all.select {|dogs| dogs.owner == self}
end

def buy_cat(cat)
  Cat.new(cat, self)
end

def buy_dog(dog)
  Dog.new(dog, self)
end 

def walk_dogs
 self.dogs.collect {|dog| dog.mood = "happy"}
end 

def feed_cats
  self.cats.collect {|cat| cat.mood = "happy"}
end

def sell_pets
  pets = dogs + cats
  pets.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
  end
end

def list_pets
  "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
end 


 def self.all 
  @@all
 end

 def self.count
  @@all.size
 end

 def self.reset_all
  @@all.clear
 end
  
end