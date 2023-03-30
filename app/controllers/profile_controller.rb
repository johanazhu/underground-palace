class ProfileController < ApplicationController


    def show
        @profile = User.find_by(username: params[:name])  
    end

end
