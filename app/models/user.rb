class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  attr_accessor :invitation_code

  validate on: :create do |user|
    InviteValidator.new(user).validate
  end

   # Validates for NHLSTENDEN.com and STUDENT.NHLSTENDEN.COM
   validates :email, format: {
      with: /\b[A-Z0-9._%a-z\-]+@(?:student.)?nhlstenden\.com\z/, message: "must be a nhlstenden.com account"
   }

   has_one_attached :avatar do |attachable|
      attachable.variant :thumb, resize: "100x100"
   end

   has_many :posts, dependent: :delete_all

   has_many :user_tags
   has_many :tags, :through => :user_tags

   has_many :comments, dependent: :delete_all

   before_validation :create_slug

   def confirmation_required?
      !confirmed?
    end

    def create_slug
       if slug.blank? && name.present?
         self.slug = name_to_slug
       end
     end

     def name_to_slug
       "#{name.to_s.downcase.parameterize.tr('_', '')}-#{rand(100_000).to_s(26)}"
     end
end

class InviteValidator
  def initialize(user)
    @user = user
  end

  def validate
    @invite = InvitationCode.find_by!(code: @user.invitation_code)
    rescue ActiveRecord::RecordNotFound
    if @invite.nil?
      @user.errors.add :base, "This code is invalid"
    end
  end
end
