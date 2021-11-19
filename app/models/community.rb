class Community < ApplicationRecord
    CATEGORIES = ["Design", "Development", "Concepting", "Testing"]

    belongs_to :createdBy, class: :users
    belongs_to :owner, class: :users
end
