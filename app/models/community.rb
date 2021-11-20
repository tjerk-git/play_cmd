class Community < ApplicationRecord
    include Sluggable

    CATEGORIES = %w[Design Development Concepting Testing]

    slugging :title

    # Relations
    has_many    :community_members, dependent: :delete_all
    has_many    :members, through: :community_members

    belongs_to  :created_by, class: :users
    belongs_to  :owner, class: :users
end
