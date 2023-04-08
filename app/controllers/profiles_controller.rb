class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:show, :like ]
    before_action :set_profile

    def show
        # 对某个用户写的文章进行分页
        @articles = @user.articles.page(params[:page]).order(created_at: :desc)
    end

    def likes
        likes =  Like.where(user_id: @user.id)
        @articles = Article.page(params[:page]).where(id: likes.pluck(:article_id)).order(created_at: :desc)
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
