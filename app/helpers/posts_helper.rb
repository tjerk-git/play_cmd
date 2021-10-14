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
end
