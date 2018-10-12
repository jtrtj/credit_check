## Credit Check
This was my first Ruby app that had a test and implemented a class

The project spec from Turing can be found here: [here](http://backend.turing.io/module1/projects/credit_check).

Small code snippet:
```ruby
class CreditCheck
  def credit_card_check(credit_card_number)
      get_sum_of_luhn_array(credit_card_number) % 10 == 0
  end
```
