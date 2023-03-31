class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    before_action :set_profile

    def show
    end

    def follow
        current_user.follow @user

        respond_to do |format|
            format.js
        end
    end

    def unfollow
        current_user.unfollow @user

        respond_to do |format|
            format.js
        end
    end

    private
    
    def set_profile
        @user = User.find_by_username(params[:username])
    end

end
