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
end
