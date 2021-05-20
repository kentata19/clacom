class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = UserPost.where(user_id: @user.id).pluck(:post_id)
    @reviews = @user.reviews
  end
end
