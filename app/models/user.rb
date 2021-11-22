class User < ApplicationRecord
  include Sluggable

  ROLES       = %w[user teacher admin].freeze
  ADMIN_ROLES = %w[teacher admin].freeze

  slugging :first_name

  devise    :database_authenticatable, 
            :registerable,
            :recoverable, 
            :rememberable, 
            :validatable,
            :confirmable

  validates :first_name, :last_name, presence: true
  validates :role, presence: true, inclusion: {
    in: ROLES
  }
  validates :email, format: {
    with: /\b[A-Z0-9._%a-z\-]+@(?:student.)?nhlstenden\.com\z/,
    message: "must be a nhlstenden.com account"
  }

  scope :admins, -> { where(role: ADMIN_ROLES) }

  # Relations
  has_many :communities
  has_one_attached :avatar

  def avatar?
    avatar.attached?
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def assignable_roles
    ROLES[0..ROLES.index(role)]
  end
end
