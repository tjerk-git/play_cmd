class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.post = Post.find(params[:post_id])
        if @comment.save!
          CommentMailer.with(comment: @comment).feedback_email.deliver_now
          redirect_to post_path(@comment.post.slug), success: 'Feedback delivered. Your rock 🤘!'
        else
          flash.now[:alert] = 'comment niet opgeslagen'
        end
    end

    private
    def comment_params
        params.require(:comment).permit(
            :current_user,
            :body,
        )
    end
end
