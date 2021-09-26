class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

   # Validates for NHLSTENDEN.com
   validates :email, format: {
      with: /\b[A-Z0-9._%a-z\-]+@nhlstenden\.com\z/, message: "must be a nhlstenden.com account" 
   }

   has_one_attached :avatar do |attachable|
      attachable.variant :thumb, resize: "100x100"
   end

   has_many :posts
   acts_as_taggable_on :skills
end
