class ProfilesController < ApplicationController
    # skip_before_action :authenticate_user, only: [:show], raise: false
    before_action :authenticate_user!
    # before_action :set_profile

    def show
        @profile = User.find_by_username(params[:username])
    end

    def follow
        p "=================="
        p params[:article_id]   
        # @article = Article.find(params[:article_id])
        @user = User.find_by_username(params[:username])
        current_user.follow @user

        respond_to do |format|
            format.js
        end

    end

    def unfollow
        @user = User.find_by_username(params[:username])
        current_user.unfollow @user
        respond_to do |format|
            format.js
        end
    end

    # private
    # def set_profile
    #     @profile = User.find_by_username(params[:username])
    # end

end
