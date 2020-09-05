require 'payjp'

class MyPayjp
  # Payjp::api_key = ENV["PAYJP_PRIVATE_KEY"]
  Payjp::api_key = 'sk_test_4ef144e52e98103e9589be95'

  def self.create_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    token.id
  end

  def self.create_customer_token(number, cvc, exp_month, exp_year)
    token = self.create_token(number, cvc, exp_month, exp_year)
    Payjp::Customer.create(card: token)
  end

  def self.create_charge_by_token(customer, amount)
    Payjp::Charge.create(
      amount:   amount,
      customer: customer,
      currency: 'jpy'
    )
  end
end 