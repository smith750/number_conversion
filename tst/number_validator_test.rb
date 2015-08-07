require_relative "../src/number_validator"
require "test/unit"

class TestNumberValidator < Test::Unit::TestCase
  def test_validation_suceeds_with_good_number()
    result = NumberValidator.validate("123,456.78")
    assert_equal(1, result.size, "We should have one result")
    assert_equal(NumberValidator::Success, result[0].class, "Results should have a single Success object")
  end
  
  def test_validation_fails_on_unparsable_number()
    result = NumberValidator.validate("hippo")
    assert_equal(NumberValidator::Failure, result[0].class, "Results should have a failure object")
    assert_equal("\"hippo\" is not numeric", result[0].message, "Failure should warn of not numeric")
  end
  
  def test_validation_fails_on_negative_number()
    result = NumberValidator.validate("-452")
    assert_equal(NumberValidator::Failure, result[0].class, "Results should have a failure object")
    assert_equal("\"-452\" should be a positive number", result[0].message, "Failure should warn of not positive")
  end
  
  def test_validation_fails_on_too_large_number()
    result = NumberValidator.validate("100000000000000000000000000000000")
    assert_equal(NumberValidator::Failure, result[0].class, "Results should have a failure object")
    assert_equal("\"100000000000000000000000000000000\" is too large to parse", result[0].message, "Failure should warn of too large a number")
  end
end