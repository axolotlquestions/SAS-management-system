require_relative './animal'
require_relative './owner'
require_relative '../db/sql_runner'

class Adoption

  attr_reader :id
  attr_accessor :animal_id, :owner_id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @animal_id = details['animal_id'].to_i()
    @owner_id = details['owner_id'].to_i()
  end


    def save()
      sql = "INSERT INTO adoptions
      (
        animal_id,
        owner_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id;"
      values = [@animal_id, @owner_id]
      adoption = SqlRunner.run( sql, values ).first
      @id = adoption['id'].to_i()
    end

  #read

    def self.all()
      sql = "SELECT * FROM adoptions;"
      values = []
      adoptions = SqlRunner.run(sql, values)
      result = adoptions.map { |adoption| Adoption.new(adoption) }
      return result
    end

    def self.find(id)
      sql = "SELECT * FROM adoptions WHERE id = $1;"
      values = [id]
      results = SqlRunner.run(sql, values)
      adoption = results.first[0]
      return Adoption.new(adoption)
    end

  #update

    def update()
     sql = "
     UPDATE adoptions SET (
       animal_id,
       owner_id
     ) =
     (
       $1, $2
     )
     WHERE id = $3;"
     values = [@animal_id, @owner_id, @id]
     SqlRunner.run(sql, values)
    end

  #delete

    def self.delete_all()
      sql = "DELETE FROM adoptions;"
      values = []
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM adoptions where id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def animal()
      sql = "SELECT * FROM animals
      WHERE id = $1"
      values = [@animal_id]
      results = SqlRunner.run( sql, values )
      return Animal.new( results.first )
    end

end
