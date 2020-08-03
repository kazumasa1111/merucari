class ContractsController < ApplicationController
  require_relative './../creditcard/payjp.rb'
  # before_action :set_product

  def new
  end

  def create
    Payjp.api_key = "鍵"
    Payjp::Charge.create(
      amount: 809, 
      card: params['payjp-token'], 
      currency: 'jpy'
    ) 
    redirect_to root_path, notice: "購入が完了しました"
  end

  # def set_product
  #   @product = Product.find(params[:product_id])
  # end

end
