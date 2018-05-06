require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check.rb'

class CreditCheckTest < MiniTest::Test
  def setup
    # credit card number for c1
    @credit_card_number_c1 = "5541808923795240"
    # credit card number for c2
    @credit_card_number_c2 = "4024007106512380"
    # c1 should carry a valid credit card number
    @c1 = CreditCheck.new
    # c2 should carry an invalid credit card number
    @c2 = CreditCheck.new
    # Valid American Express number
    @american_express_number_aec1 = "342804633855673"
    # Invalid American Express number
    @american_express_number_aec2 = "342801633855673"
    # aec1 should carry a valid American Express number
    @aec1 = CreditCheck.new
    # aec2 should carry an invalid American Express number
    @aec2 = CreditCheck.new
  end

  def test_it_exists
    expected = CreditCheck
    actual = @c1

    assert_instance_of expected, actual
  end

  def test_the_credit_card_number_is_an_integer
    expected = Integer
    actual = @c1.turn_into_integer(@credit_card_number_c1)

    assert_instance_of expected, actual

    expected = 5541808923795240
    actual = @c1.turn_into_integer(@credit_card_number_c1)

    assert_equal expected, actual
  end

  def test_the_credit_card_number_is_a_reversed_array
    expected = Array
    actual = @c1.turn_into_reversed_array(@credit_card_number_c1)

    assert_instance_of expected, actual

    expected = [0, 4, 2, 5, 9, 7, 3, 2, 9, 8, 0, 8, 1, 4, 5, 5]
    actual = @c1.turn_into_reversed_array(@credit_card_number_c1)

    assert_equal expected, actual
  end

  def test_check_if_every_other_number_is_doubled
    expected = [0, 8, 2, 10, 9, 14, 3, 4, 9, 16, 0, 16, 1, 8, 5, 10]
    actual = @c1.double_every_other_number(@credit_card_number_c1)

    assert_equal expected, actual

    expected = [0, 16, 3, 4, 1, 10, 6, 0, 1, 14, 0, 0, 4, 4, 0, 8]
    actual = @c2.double_every_other_number(@credit_card_number_c2)

    assert_equal expected, actual
  end

  def test_check_if_number_over_ten_split_digits_then_sum_digits
    expected = [0, 8, 2, 1, 9, 5, 3, 4, 9, 7, 0, 7, 1, 8, 5, 1]
    actual = @c1.if_over_ten_split_digits_then_sum_digits(@credit_card_number_c1)

    assert_equal expected, actual

    expected = [0, 7, 3, 4, 1, 1, 6, 0, 1, 5, 0, 0, 4, 4, 0, 8]
    actual = @c2.if_over_ten_split_digits_then_sum_digits(@credit_card_number_c2)

    assert_equal expected, actual
  end

  def test_get_sum_of_every_other_digit_doubled_checked_over_ten_then_summed
    expected = 70
    actual = @c1.get_sum_of_luhn_array(@credit_card_number_c1)

    assert_equal expected, actual

    expected = 44
    actual = @c2.get_sum_of_luhn_array(@credit_card_number_c2)

    assert_equal expected, actual
  end

  def test_can_it_validate_using_luhn_algorithm
    expected = true
    actual = @c1.credit_card_check(@credit_card_number_c1)

    assert_equal expected, actual

    expected = false
    actual = @c2.credit_card_check(@credit_card_number_c2)

    assert_equal expected, actual
  end

  def test_can_it_validate_american_express
    expected = true
    actual = @aec1.credit_card_check(@american_express_number_aec1)

    assert_equal expected, actual

    expected = false
    actual = @aec2.credit_card_check(@american_express_number_aec2)

    assert_equal expected, actual
  end

end
