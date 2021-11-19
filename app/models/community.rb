class Community < ApplicationRecord
    include Sluggable

    CATEGORIES = ["Design", "Development", "Concepting", "Testing"]

    slugging :title

    belongs_to :createdBy, class: :users
    belongs_to :owner, class: :users
end
