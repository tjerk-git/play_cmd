class Post < ApplicationRecord

  belongs_to :user

  has_many_attached :images do |attachable|
    attachable.variant :cover, resize: "900x700"
    attachable.variant :large_thumb, resize: "350x235"
  end

  acts_as_taggable_on :skills
  
end
