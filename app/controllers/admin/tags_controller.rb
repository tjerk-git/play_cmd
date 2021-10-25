class Admin::TagsController < ApplicationController
    layout 'admin'

    def index
        if current_user.role != 1
            redirect_to posts_path(), notice: 'nooo, noo no!'
        end
        @tags = Tag.all()
        @tag = Tag.new()
    end

    def edit

    end

    def update

    end

    def show

    end

    def new

    end

    def create
        @tag = Tag.new(create_params)
        if @tag.save
            redirect_to admin_tags_path(), notice: 'Tag aangemaakt'
        else
            render :index
        end
    end

    private
    def create_params
        params.require(:tag).permit(
            :name
        )
    end
end
