module TagHelper
  def is_subscribed(user, tag)
    user.tags.find_by_id(tag.id)
  end
end
