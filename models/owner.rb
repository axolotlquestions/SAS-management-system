require_relative '../db/sql_runner'

class Owner

attr_accessor :name
attr_reader :id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @name = details['name']
  end

  #create

  def save()
    sql = "INSERT INTO owners (name) VALUES ($1) RETURNING id;"
    values = [@name]
    owner = SqlRunner.run(sql, values)
    @id = owner['id'].to_i()
  end

  #read

  def self.all()
    sql = "SELECT * FROM owners;"
    values = []
    owners = SqlRunner.run(sql, values)
    result = owners.map { |owner| Owner.new(owner) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1;"
    values = [id]
    owners = SqlRunner.run(sql, values)
    result = owners.map { |owner| Owner.new(owner) }
    return result
  end

  #update
  def update()
    sql = "UPDATE owners SET (name)
    = ($1)
    WHERE id = $2;"
    values = [@name]
    SqlRunner.run(sql, values)
  end

  #delete

  def self.delete_all()
    sql = "DELETE FROM owners;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM owners WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
