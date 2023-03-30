class ProfileController < ApplicationController


    def show
        @profile = User.find_by(username: params[:name])  
        # @articles = @profile.articles
        p "=================="
        p  @profile
    end

end
