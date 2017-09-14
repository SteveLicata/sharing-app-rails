class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
     @user = User.find(params[:id])
     @users = User.all
     @user_posts = @user.posts
  end

end
