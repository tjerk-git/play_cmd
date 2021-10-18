class HighlightsController < ApplicationController

    def create
        @highlight = Highlight.new(highlight_params)
        @post = Post.find(params[:post_id])
        @highlight.user = current_user
        @highlight.post = @post
        if @highlight.save
          HighlightMailer.with(highlight: @highlight).highlight_email.deliver_now
          redirect_to post_path(@post.slug), notice: 'Spotlight added!'
        else
          # render :new
        end
    end


    private
    def highlight_params
        params.require(:highlight).permit(
            :current_user,
            :body
        )
    end
end
