
class HighlightMailer < ApplicationMailer
  default template_path: "mailers/#{self.name.underscore}"

  def highlight_email
    @highlight = params[:highlight]
    mail(to: @highlight.post.user.email, subject: 'YOU GOT THE SPOTLIGHT!')
  end
end
