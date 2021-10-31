class TagController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by_slug(params[:slug])
    @posts = @tag.posts.paginate(:page => params[:page], :per_page => 10)
  end

  def members
    @tag = Tag.find_by_slug(params[:slug])
    @users = @tag.users.paginate(:page => params[:page], :per_page => 10)
  end

  def highlighted
    @tag = Tag.find_by_slug(params[:slug])
    @posts = @tag.posts.joins(:highlights).paginate(:page => params[:page], :per_page => 10)
  end

  def subscribe
    @tag = Tag.find_by_slug(params[:slug])
    UserTag.create(:user_id => current_user.id, :tag_id => @tag.id)
    redirect_to tag_path(@tag.slug), :success => "You are now subscribed to #{@tag.name}"
  end

  def new
    @tag = Tag.new()
  end

  def create
    @tag = Tag.new(tag_params.merge(color: "gray"))
    if @tag.save
      redirect_to tag_path(@tag.slug), :success => "Tag created"
    else
      render turbo_stream: turbo_stream.update(view_context.dom_id(@tag, :new_tag_form), partial: "new_tag_form")
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :description)
  end

end
