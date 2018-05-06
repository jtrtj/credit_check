require 'pry'

# Your Luhn Algorithm Here
class CreditCheck
  def credit_card_check(credit_card_number)
      get_sum_of_luhn_array(credit_card_number) % 10 == 0
  end

  def turn_into_integer(credit_card_number)
    credit_card_number.to_i
  end

  def turn_into_reversed_array(credit_card_number)
    turn_into_integer(credit_card_number).digits
  end

  def double_every_other_number(credit_card_number)
    turn_into_reversed_array(credit_card_number).map.with_index do |num,index|
      if index.even?
        num
      else
        num*2
      end
    end
  end
# write above with if/else as a new method
  # def double_every_other_number(credit_card_number)
  #   turn_into_reversed_array(credit_card_number).map.with_index do |num,index|
  #     check_index(num, index)
  #   end
  # end
  #
  # def check_index(num, index)
  #   if index.even?
  #     num
  #   else
  #     num*2
  #   end
  # end

  def if_over_ten_split_digits_then_sum_digits(credit_card_number)
    double_every_other_number(credit_card_number).map.with_index do |num,index|
      if index.even?
        num
      else
        if num > 9
          num = num.to_s.chars

          new_num = num.map do |n|
            n.to_i
          end
          new_num.sum

        else
          num
        end
      end
    end
  end

  def get_sum_of_luhn_array(credit_card_number)
    if_over_ten_split_digits_then_sum_digits(credit_card_number).sum
  end

end

# Output
valid = CreditCheck.new.credit_card_check("4929735477250543")
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"
if valid == true
  puts "The number is valid!"
else
  puts "The number is invalid!"
end
