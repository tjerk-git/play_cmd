module ProfileHelper
    def is_teacher(user)
        return user.role == 1
    end
end
