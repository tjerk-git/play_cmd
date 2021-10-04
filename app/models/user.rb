
class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

   # Validates for NHLSTENDEN.com and STUDENT.NHLSTENDEN.COM
   validates :email, format: {
      with: /\b[A-Z0-9._%a-z\-]+@(?:student.)?nhlstenden\.com\z/, message: "must be a nhlstenden.com account"
   }

   has_one_attached :avatar do |attachable|
      attachable.variant :thumb, resize: "100x100"
   end

   has_many :posts
   has_many :user_tags
   has_many :users, :through => :user_tags
   has_many :comments
end
