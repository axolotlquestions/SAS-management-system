require 'Date'
require_relative '../db/sql_runner'

class Animal

attr_accessor :name, :species, :breed, :adoptable
attr_reader :id


  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @name = details['name']
    @species = details['species']
    @breed = details['breed']
    @adoptable = convert_to_boolean(details['adoptable'])
    @admission_date = Date.parse(details['admission_date'])
  end

  def convert_to_boolean(status)
    if status == "t" || status == true
      return true
    end
    return false
  end

#create

  def save()
    sql = "INSERT INTO animals (name, species, breed, adoptable, admission_date)
    VALUES ($1, $2, $3, $4, $5) RETURNING id;"
    values = [@name, @species, @breed, @adoptable, @admission_date]
    animal = SqlRunner.run(sql, values).first
    @id = animal['id'].to_i()
  end

#read

  def self.all()
    sql = "SELECT * FROM animals;"
    values = []
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1;"
    values = [id]
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal) }.first
    return result
  end

  def self.all_adoptable
    sql = "SELECT * FROM animals WHERE adoptable = $1;"
    values = ['t']
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def self.find_by_breed(breed)
    sql = "SELECT * FROM animals WHERE breed = $1;"
    values = [breed]
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

#update

  def update()
    sql = "UPDATE animals SET (name, species, breed, adoptable, admission_date)
    = ($1, $2, $3, $4, $5)
    WHERE id = $6;"
    values = [@name, @species, @breed, @adoptable, @admission_date, @id]
    SqlRunner.run(sql, values)
  end

#delete

  def self.delete_all()
    sql = "DELETE FROM animals;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM animals WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def admission_date
    d = @admission_date
    return d.strftime("%d-%m-%Y")
  end

  def adoptable_display
    if @adoptable
      return "Yes"
    end
    return "No"
  end

end
