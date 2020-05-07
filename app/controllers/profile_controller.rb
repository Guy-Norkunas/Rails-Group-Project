class ProfileController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @posts = current_user.posts
    end

    def show
        @user = User.find(params[:id])
        if @user == current_user
            redirect_to user_profile_url
        end
        @posts = @user.posts
    end
end
