module PostsHelper

    def is_teacher
        return current_user.role == 1
    end

    def is_your_post(post)
        return current_user == post.user
    end
end
