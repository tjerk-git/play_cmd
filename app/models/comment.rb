class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    belongs_to :feedback_type, foreign_key: "type_id", optional: true

    has_rich_text :body
end
