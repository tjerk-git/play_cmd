class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:public]

    def index
        # TODO - .order(highlight: :asc) is not working when there are no highlights
        @posts = Post.paginate(page: params[:page], per_page: 30).order(created_at: :desc)
        @tags = Tag.all()
    end

    def edit
        @post = Post.find_by!(slug: params[:slug])
    end

    def update
        @post = Post.find(params[:slug])
        if @post.update(update_post_params)
            redirect_to post_path(@post.slug), success: 'Post edited 🚀'
        else
        render :new
        end
    end

    def like
        @post = Post.find(params[:id])
        Like.create(user: current_user, post: @post)
        redirect_to post_path(@post.slug)
    end

    def for_you
        @posts = Post.joins(:tags)
        .where(tags: { id: current_user.tag_ids })
        .paginate(page: params[:page], per_page: 30)
        .distinct
        render :index
    end

    def by_tag
        @posts = Post.joins(:tags)
        .where(tags: { slug: params[:slug] })
        .order(created_at: :desc)
        .paginate(page: params[:page], per_page: 30)
        .distinct
        @tag = Tag.find_by_slug(params[:slug])
        render :index
    end

    def filter
        @tag = Tag.find_by(id: params[:tag_ids])
        @posts = Post.joins(:tags)
        .where(tags: { id: params[:tag_ids] })
        .order(created_at: :desc)
        .paginate(page: params[:page], per_page: 30)
        .distinct
        render :index
    end

    def highlight_modal
        @post = Post.find_by!(slug: params[:slug])
        @post_by_user = @post.user.posts.take(3).excluding(@post)
        @highlight = Highlight.new()
        render :show
    end

    def show
        @post = Post.find_by!(slug: params[:slug])
        @post_by_user = @post.user.posts.take(3).excluding(@post)
        @comment = Comment.new()
        if @post && @post.cover_image.attached?
            @image = url_for(@post.cover_image)
        end
    rescue ActiveRecord::RecordNotFound
        if @posts.nil?
            render "not_found"
        end
    end

    def public
        @post = Post.find_by!(slug: params[:slug])
        render :public_post, :layout => false
    rescue ActiveRecord::RecordNotFound
        if @posts.nil?
            render "not_found"
        end
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
          render :new
        end
    end


    def destroy
        @post = Post.find_by_slug(params[:slug])
        if @post
            if @post.destroy!
                redirect_to posts_path, notice: 'Post verwijderd'
            end
        end
    end

private
    def update_post_params
        params.require(:post).permit(
            :id,
            :slug,
            :title,
            :current_user,
            :body,
            :cover_image => [],
            :tag_ids => [],
        )
    end
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
