require_relative '../models/animal'
require_relative '../models/owner'
require_relative '../models/adoption'

require 'pry-byebug'

Animal.delete_all
Owner.delete_all

animal1 = Animal.new({ 'name' => "Fluffy", 'species' => "Cat", 'breed' => "Persian", 'adoptable' => true, 'admission_date' => "2017-06-20"})
animal2 = Animal.new({ 'name' => "Rover", 'species' => "Dog", 'breed' => "Jack Russell", 'adoptable' => true, 'admission_date' => "2017-08-15"})
animal3 = Animal.new({ 'name' => "Henry", 'species' => "Dog", 'breed' => "Bearded Collie", 'adoptable' => false, 'admission_date' => "2017-10-01"})

animal1.save()
animal2.save()
animal3.save()

owner1 = Owner.new({'name' => "Alice"})
owner2 = Owner.new({'name' => "Bob"})
owner3 = Owner.new({'name' => "Carol"})

owner1.save()
owner2.save()
owner3.save()

binding.pry
nil
