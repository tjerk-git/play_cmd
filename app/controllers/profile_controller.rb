class ProfileController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find_by_slug(params[:slug])
    end

    def list
        if params[:query] != ""
            query = params[:query]
            @users = User.where("name ilike ?", "%#{query}%")
        end
    end

    def hide_onboarding
        @user = current_user
        @user.onboarding_seen = true
        @user.save
        render turbo_stream: turbo_stream.update("onboarding", partial: "shared/onboarding_modal")
    end

    def by_tag
        @users = User.joins(:tags).where(tags: { slug: params[:slug] }).order(created_at: :desc)
        @tag = Tag.find_by_slug(params[:slug])
        render :list
    end


    private
    def user_params
      params.require(:user).permit(:email_address, :name, :password, :avatar)
    end
end
