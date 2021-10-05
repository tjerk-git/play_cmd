class ProfileController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find_by_slug(params[:slug])
    end

    def list
        case
        when params[:tag_ids]
            @users = User.joins(:tags).where(tags: { id: params[:tag_ids] })         
        when params[:query]
            query = params[:query]
            @users = User.where("name like ?", "%#{query}%")
        else
          @users = User.all()
        end
    end


    private
    def user_params
      params.require(:user).permit(:email_address, :name, :password, :avatar)
    end
end
