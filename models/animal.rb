class Animal

attr_accessor :name, :species, :breed, :adoptable, :admission_date, :owner_id
attr_reader :id


  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @name = details['name']
    @species = details['species']
    @breed = details['breed']
    @adoptable = details['adoptable']
    @admission_date = details['admission_date']
    @owner_id = details[owner_id].to_i()
  end



end
