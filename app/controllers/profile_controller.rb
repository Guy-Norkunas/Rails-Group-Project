class ProfileController < ApplicationController
    def index
        p current_user
    end
end
