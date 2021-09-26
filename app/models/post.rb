class Post < ApplicationRecord

  belongs_to :user

  has_many_attached :images do |attachable|
    attachable.variant :cover, resize: "1000x1000"
    attachable.variant :large_thumb, resize: "500x500"
  end

  acts_as_taggable_on :skills
  
end
