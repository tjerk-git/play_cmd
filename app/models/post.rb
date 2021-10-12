class Post < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  has_many :post_tags, dependent: :delete_all
  has_many :tags, :through => :post_tags

  has_rich_text :body
  
  validates :title, presence: true
  before_validation :create_slug

  has_one_attached :cover_image

  def liked?(user)
    !!self.likes.find{|like| like.user == user}
  end

  def create_slug
    if slug.blank? && title.present?
      self.slug = title_to_slug
    end
  end

  def title_to_slug
    "#{title.to_s.downcase.parameterize.tr('_', '')}-#{rand(100_000).to_s(26)}"
  end
end
