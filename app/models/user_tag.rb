class UserTag < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :tag, dependent: :destroy
end
