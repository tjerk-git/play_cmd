module ApplicationHelper
    def is_active(action)
        params[:action] == action ? "active" : nil
    end

    def image_avatar
        if current_user.avatar.attached?
            return rails_blob_url(current_user.avatar)
        else
            return "https://ui-avatars.com/api/?name=" + current_user.name + ";color=7F9CF5&amp;background=EBF4FF"
        end
    end

    def importmap()
        safe_join [javascript_inline_importmap_tag()]
    end
end
