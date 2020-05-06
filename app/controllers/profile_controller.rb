class ProfileController < ApplicationController
    before_action :authenticate_user!
    def index
        @posts = current_user.posts
    end
    def show
        @user = User.find(params[:id])
        @posts = @user.posts
    end
end
