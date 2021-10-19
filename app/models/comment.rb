class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    has_one :feedback_type

    has_rich_text :body
end
