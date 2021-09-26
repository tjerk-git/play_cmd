class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

   # Validates for NHLSTENDEN.com
   validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@nhlstenden\.com\z/, message: "must be a nhlstenden.com account" }
end
