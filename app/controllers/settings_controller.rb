class SettingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

    def show
        # 获取当前用户信息
        # @user = current_user
    end

    def update
        if @user.update(user_params)
            # 后续跳转到个人设置页面
            redirect_to root_path
            flash[:notice] = '修改成功'
        else
            render :show
        end
    end
  

    private

    def set_user
      @user = current_user
    end

    def user_params
        params.require(:user).permit(:username, :email, :avatar, :bio)
        
    end
    
end
