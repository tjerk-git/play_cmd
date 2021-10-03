class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all()
        @tags = Tag.all()
    end

    def for_you
        @posts = Post.joins(:tags).where(tags: { name: params[:tag] })
    end

    def by_tag
        @posts = Post.joins(:tags).where(tags: { name: params[:tag] })
        render :index
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new()
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save!
          redirect_to @post, notice: 'Bericht aangemaakt'
        else
          flash.now[:alert] = 'Bericht niet opgeslagen'
          render :new
        end
    end

    def gallery
        @post = Post.find(params[:id])
    end

private
    def post_params
        params.require(:post).permit(
            :title,
            :current_user,
            :body,
            :images => [],
            :tag_ids => [],
        )
    end
end
