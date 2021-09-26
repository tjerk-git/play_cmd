class PostsController < ApplicationController
    before_action :authenticate_user!

    def index

        if params[:tag]
            @posts = Post.tagged_with(["awesome", "cool"], :match_all => true)
        else
            @posts = Post.all()
        end
       
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new()
    end

    def create
        post = Post.new(post_params)
        post.images.attach(params[:images])
        post.user = current_user
        post.skill_list.add(params[:skill_list])

        post.save
        redirect_to post
    end

    def gallery
        @post = Post.find(params[:id])
    end

private
    def post_params
        params.require(:post).permit(:skill_list, :title, :body, images: [])
    end
end
