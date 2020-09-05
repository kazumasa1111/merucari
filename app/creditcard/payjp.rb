require 'payjp'
require 'pry'

class MyPayjp
  # Payjp::api_key = ENV["PAYJP_PRIVATE_KEY"]
  Payjp::api_key = 'sk_live_1f91f7629f35be668ff929d25c9161ad7367f736e7068e5b93dd0e3e'

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