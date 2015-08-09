require_relative "../src/number_validator"
require "test/unit"

class TestNumberValidator < Test::Unit::TestCase
  def test_validation_suceeds_with_good_number()
    result = NumberValidator.validate("123,456.78")
    assert(result.success?, "Results should be successful")
  end
  
  def test_validation_fails_on_unparsable_number()
    result = NumberValidator.validate("hippo")
    assert(!result.success?, "Results should not be a success")
    assert_equal("\"hippo\" is not numeric", result.error_messages[0], "Failure should warn of not numeric")
  end
  
  def test_validation_fails_on_negative_number()
    result = NumberValidator.validate("-452")
    assert(!result.success?, "Results should not be a success")
    assert_equal("\"-452\" should be a positive number", result.error_messages[0], "Failure should warn of not positive")
  end
  
  def test_validation_fails_on_too_large_number()
    result = NumberValidator.validate("100000000000000000000000000000000")
    assert(!result.success?, "Results should not be a success")
    assert_equal("\"100000000000000000000000000000000\" is too large to parse", result.error_messages[0], "Failure should warn of too large a number")
  end
end