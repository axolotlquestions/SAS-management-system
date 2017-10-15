require 'minitest/autorun'
require 'minitest/rg'

require_relative '../owner'

class TestOwner < MiniTest::Test

  def setup()
    @owner1 = Owner.new({'name' => "Alice"})
  end

  def test_owner_has_name
    expected = "Alice"
    actual = @owner1.name
    assert_equal(expected, actual)
  end

end
