module Api
    module V0
        class PostsController < ApiController
            def index
                total = (params[:total] || 10).to_i

                @posts = Post.includes(:user).order(created_at: :desc).take(total)
                render "api/v0/posts/index", formats: :json
            end
        end
    end
end
