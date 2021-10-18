class CommentMailer < ApplicationMailer
  default template_path: "mailers/#{self.name.underscore}"

  def feedback_email
    @comment = params[:comment]
    if @comment.user.name
        @commenter = @comment.user.name
    else
        @commenter = @comment.user.email
    end
    mail(to: @comment.post.user.email, subject: 'Someone left some feedback for you!')
  end
end
