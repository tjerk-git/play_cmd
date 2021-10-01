class PostsController < ApplicationController
    before_action :authenticate_user!

    def index

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
        post = Post.new(post_params)
        post.user = current_user
        post.skill_list.add(params[:skill_list])
        post.save()
        redirect_to post, inertia: { newCreated: true }
    end

    def gallery
        @post = Post.find(params[:id])
    end

private
    def post_params
        params.require(:postItem).permit(:title, :body, :images, :skill_list)
    end
end
