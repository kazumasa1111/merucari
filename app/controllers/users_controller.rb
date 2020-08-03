class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @posts = @user.posts
    @card = Card.all
  end
end
