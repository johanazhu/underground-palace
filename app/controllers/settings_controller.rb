class SettingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

    def show
        # 获取当前用户信息
        # @user = current_user
    end

    def update
        case params[:by]
        when 'password'
            update_password
        else 
            update_basic
        end
    end
  

    private

    def set_user
      @user = current_user
    end

    def user_params
        params.require(:user).permit(:username, :email, :avatar, :bio)
        
    end

    def update_basic
        if @user.update(user_params)
            # 后续跳转到个人设置页面
            redirect_to root_path
            flash[:notice] = '修改成功'
        else
            render :show
        end
    end

    def update_password
        if @user.update_with_password(user_params)
          redirect_to new_session_path(:user)
        else
          render "password"
        end
    end
    
end
