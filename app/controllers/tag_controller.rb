class TagController < ApplicationController
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
end
