class PostController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def show
    p Post.find(params[:id])
    @post = Post.find(params[:id])
  end

  def create
    new_post = current_user.posts.new(post_params)
    if new_post.save
      redirect_to new_post
    else
      render 'index'
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end

end
