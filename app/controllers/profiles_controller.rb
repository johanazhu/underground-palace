class ProfilesController < ApplicationController


    def show
        p "++++++++++++++++++++++"
        # @profile = User.find_by(username: params[:username])  
        @profile = User.find_by_username(params[:username])
    end

end
