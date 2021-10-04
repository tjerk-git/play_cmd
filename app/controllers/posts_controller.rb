class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all()
        @tags = Tag.all()
    end

<<<<<<< HEAD
        if params[:tag]
            @posts = Post.tagged_with(["awesome", "cool"], :match_all => true)
        else
            @posts = Post.all()
        end

        render inertia: 'Post/Index', props: {
            posts: @posts
        }
    end

    def show
        @post = Post.find(params[:id])
        render inertia: 'Post/Show', props: {
            post: @post
        }
=======
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
>>>>>>> cedf11736d3a7c62427ebed59233146011d989c8
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
<<<<<<< HEAD
        post = Post.new(post_params)
        post.user = current_user
        post.skill_list.add(params[:skill_list])
        post.save()
        redirect_to post, inertia: { newCreated: true }
=======
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save!
          redirect_to @post, notice: 'Bericht aangemaakt'
        else
          flash.now[:alert] = 'Bericht niet opgeslagen'
          render :new
        end
>>>>>>> cedf11736d3a7c62427ebed59233146011d989c8
    end

    def gallery
        @post = Post.find(params[:id])
    end

private
    def post_params
<<<<<<< HEAD
        params.require(:postItem).permit(:title, :body, :images, :skill_list)
=======
        params.require(:post).permit(
            :title,
            :current_user,
            :body,
            :images => [],
            :tag_ids => [],
        )
>>>>>>> cedf11736d3a7c62427ebed59233146011d989c8
    end
end
