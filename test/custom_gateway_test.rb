require "test_helper"

class CustomGatewayTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CustomGateway::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
