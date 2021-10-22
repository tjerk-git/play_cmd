class FeedbackType < ApplicationRecord
    has_many :comments, foreign_key: "type_id"
end
