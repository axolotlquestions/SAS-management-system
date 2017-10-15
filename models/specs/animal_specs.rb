require 'minitest/autorun'
require 'minitest/rg'

require_relative '../animal'

class TestAnimal < MiniTest::Test

  def setup()
    @animal1 = Animal.new({ 'name' => "Fluffy", 'species' => "Cat", 'breed' => "Persian", 'adoptable' => true, 'admission_date' => "27/5/2017"})
  end

  def test_animal_has_name
    expected = "Fluffy"
    actual = @animal1.name
    assert_equal(expected, actual)
  end

  def test_animal_has_species
    expected = "Cat"
    actual = @animal1.species
    assert_equal(expected, actual)
  end

  def test_animal_has_breed
    expected = "Persian"
    actual = @animal1.breed
    assert_equal(expected, actual)
  end

  def test_animal_adoptable_status
    expected = true
    actual = @animal1.adoptable
    assert_equal(expected, actual)
  end

  def test_animal_has_admission_date
    expected = "27/5/2017"
    actual = (@animal1.admission_date)
    assert_equal(expected, actual)
  end

end
