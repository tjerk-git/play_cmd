module PostsHelper

    def is_teacher(user)
        return user.role == 1
    end

    def is_your_field(user, post)
        return (user.tags & post.tags).any?
    end

    def is_your_post(post)
        return current_user == post.user
    end

    def get_cover(post)
        return rails_blob_url(post.cover_image)
    end

    def get_avatar(post)
        if post.user.avatar.attached?
            return rails_blob_url(post.user.avatar)
        else
            return "https://ui-avatars.com/api/?name=" + post.user.name + ";color=7F9CF5&amp;background=EBF4FF"
        end
    end
end
