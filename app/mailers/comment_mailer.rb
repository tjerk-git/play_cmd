class CommentMailer < ApplicationMailer
 default from: 'notifications@example.com'

  def feedback_email
    @comment = params[:comment]
    @link_to_post = post_path(@comment.post.slug)
    if @comment.user.name
        @commenter = @comment.user.name
    else
        @commenter = @comment.user.email
    end
    mail(to: @comment.post.user.email, subject: 'Someone left some feedback for you!')
  end
end
