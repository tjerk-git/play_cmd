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

    def filter
        @posts = Post.joins(:tags).where(tags: { id: params[:tag_ids] })
        render :index
    end

    def show
        @post = Post.find_by!(slug: params[:slug])
    end

    def new
        @post = Post.new()
        @tags = Tag.all().select(:name, :id)
        render inertia: 'Post/New', props: {
            post: @post,
            skills: @tags
        }
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
