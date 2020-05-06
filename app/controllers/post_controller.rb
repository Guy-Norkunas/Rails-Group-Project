class PostController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def show
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to home_page_path
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end

end
