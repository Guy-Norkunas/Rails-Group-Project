class ProfileController < ApplicationController
    before_action :authenticate_user!
    def index
        @posts = current_user.posts
    end
    def show
        @posts = User.find(params[:id]).posts
    end
end
