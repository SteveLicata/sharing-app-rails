class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
     @users = User.all
     @user_posts = @user.posts
  end

end
