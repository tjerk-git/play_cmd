class User < ApplicationRecord
has_secure_password
  ROLES       = %w[user teacher admin].freeze
  ADMIN_ROLES = %w[teacher admin].freeze

  devise    :database_authenticatable, 
            :registerable,
            :recoverable, 
            :rememberable, 
            :validatable

  validates :first_name, :last_name, presence: true

  validates :email, format: {
    with: /\b[A-Z0-9._%a-z\-]+@(?:student.)?nhlstenden\.com\z/,
    message: "must be a nhlstenden.com account"
  }

  scope :admins, -> { where(role: ADMIN_ROLES) }

  attr_accessor :first_name, :last_name

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
