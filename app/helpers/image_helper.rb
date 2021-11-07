module ImageHelper
    def avatar_url(user, size: 32)
        if user.try(:avatar) && user.try(:avatar?)
            double_size = size * 2
            user.avatar.variant(resize_to_fill: [double_size, double_size])
        else
            name        = [user.first_name, user.last_name].join("%20")
            text        = "#000"
            background  = "#fefefe"
            "https://eu.ui-avatars.com/api/?name=#{name}&size=#{size * 2}&background=#{background.delete_prefix("#")}&color=#{text.delete_prefix("#")}" # rubocop:disable Layout/LineLength
        end
    end

    def avatar_tag(user, size: 32, extra_class: "")
        image_tag avatar_url(user, size: size), alt: user.email, width: size, height: size, class: "rounded-full object-cover #{extra_class}"
    end
end
