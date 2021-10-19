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

    def edit
      @comment = Comment.find(params[:id])
    end

  def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
          redirect_to post_path(@comment.post.slug), success: 'comment edited 🚀'
      else
      render :new
      end
  end


  def destroy
    @comment = Comment.find(params[:id])
    if @comment
      comment_path = post_path(@comment.post.slug)
        if @comment.destroy!
          redirect_to comment_path, success: "It's gone... 🏴‍☠️"
        end
    end
  end

    private
    def comment_params
        params.require(:comment).permit(
            :current_user,
            :body,
            :type_id
        )
    end
end
