class PostsController < ApplicationController

  def index
    @posts = Post.all
    @user = User.find(current_user.id)
  end

  def create
    @new_post = Post.new(
      user_id: params[:post][:user_id].to_i,
      title: params[:post][:title],
      content: params[:post][:content],
      created_at: params[:post][:created_at]
    )
    @new_post.save

    if @new_post
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :new)
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_user = @post.user.first_name
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update({
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id],
      created_at: params[:post][:created_at]
      })

    if (@post)
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
  end

  def destroy
    Post.delete(params[:id])
      redirect_to url_for(:controller => :posts, :action => :index)
  end

  def shared_posts
    # Post.find(params[:post_id]).user <<
    # User.find(params[:user_id])
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :created_at)
  end

end
