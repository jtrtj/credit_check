require 'pry'

card_number = "79927398713"

valid = false

# Your Luhn Algorithm Here
def digits(cc_num)
  cc_num.to_i.digits
end

cc_array = digits(card_number)
# p cc_array

def double_every_other_digit(array)
  array.map.with_index do |num,index|
    if index.even?
      num
    else
      num *2
    end
  end
end

double_every_other_digit_array = double_every_other_digit(cc_array)
p double_every_other_digit_array

def check_over_ten(array)
  array.map.with_index do |num,index|
    if index.even?
      num
    else
      if num > 10
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

arr = check_over_ten(double_every_other_digit_array)

p arr

p arr.sum


# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"
