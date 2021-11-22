class Community < ApplicationRecord
    include Sluggable

    CATEGORIES = %w[Design Development Concepting Testing]

    slugging :title

    # Relations
    has_many    :community_members, dependent: :delete_all
    has_many    :members, through: :community_members

    belongs_to  :created_by, class_name: "User", foreign_key: "created_by"
    belongs_to  :owner, class_name: "User", foreign_key: "owner_id"
end
