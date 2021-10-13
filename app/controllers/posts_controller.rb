class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all().order(created_at: :desc)
        @tags = Tag.all()
    end

    def like
        @post = Post.find(params[:id])
        Like.create(user: current_user, post: @post)
        redirect_to post_path(@post.slug)
    end

    def for_you
        @posts = Post.joins(:tags).where(tags: { id: current_user.tag_ids })
        render :index
    end

    def by_tag
        @posts = Post.joins(:tags).where(tags: { slug: params[:slug] }).order(created_at: :desc)
        @tag = Tag.find_by_slug(params[:slug])
        render :index
    end

    def filter
        @posts = Post.joins(:tags).where(tags: { id: params[:tag_ids] }).order(created_at: :desc)
        render :index
    end

    def show
        @post = Post.find_by!(slug: params[:slug])
        @comment = Comment.new()
    end

    def new
        @post = Post.new()
    end

    def create
        @post = Post.new(post_params)
        @post.cover_image.attach(params[:cover_image])
        @post.user = current_user
        if @post.save
          redirect_to post_path(@post.slug), notice: 'Post aangemaakt'
        else
          #flash.now[:alert] = 'Post niet opgeslagen'
          render :new
        end
    end

    def gallery
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find_by!(slug: params[:slug])
        @post.destroy

        redirect_to posts_path, notice: 'Post verwijderd'
    end

private
    def post_params
        params.require(:post).permit(
            :title,
            :current_user,
            :body,
            :cover_image => [],
            :tag_ids => [],
        )
    end
end
