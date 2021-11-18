class Community < ApplicationRecord
    belongs_to :createdBy, class: :users
    belongs_to :owner, class: :users

end
