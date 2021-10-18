class HighlightMailer < ApplicationMailer
  default template_path: "mailers/#{self.name.underscore}"

  def highlight_email
    @highlight = params[:highlight]
    post_link = ENV['APP_URL'] + @highlight.post.title, "/post/" + @highlight.post.slug
    mail(to: @highlight.post.user.email, subject: 'YOU GOT THE SPOTLIGHT!')
  end
end
