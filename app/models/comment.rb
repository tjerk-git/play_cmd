class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    belongs_to :feedback_type, foreign_key: "type_id", optional: true
    has_many :comment_upvotes

    has_rich_text :body

    def upvoted?(user)
        !!self.comment_upvotes.find{|upvote| upvote.user == user}
    end
end
