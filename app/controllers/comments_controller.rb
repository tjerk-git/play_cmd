class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.post = Post.find(params[:post_id])
        if @comment.save!
          CommentMailer.with(comment: @comment).feedback_email.deliver_later
          redirect_to post_path(@comment.post.slug), notice: 'comment aangemaakt'
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