class ProfileController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find(params[:id])
    end

    def edit 
        @user = User.find(params[:id])
  
        #redirect_to root_path
    end

    def update
        user = User.find(params[:id])
        if params[:avatar]
            user.avatar.attach(params[:avatar])
        end
        user.update(user_params)
    end

    private
    def user_params
      params.require(:user).permit(:email_address, :name, :password, :avatar)
    end
end
