class CategoriesController < ApplicationController
before_action :set_category, only: :show 



def index
  @parents = Category.all
end


def show
  @parents = Category.where(ancestry: nil)
  @products = @category.set_products
  @products = @products.order("created_at DESC")
end




private

def set_category
  @category = Category.find(params[:id])
end




end
