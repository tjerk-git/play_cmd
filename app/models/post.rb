class Post < ApplicationRecord

  belongs_to :user

  before_validation :create_slug

  has_many_attached :images do |attachable|
    attachable.variant :cover, resize: "900x700"
    attachable.variant :large_thumb, resize: "350x235"
  end

  acts_as_taggable_on :skills

  def create_slug
    if slug.blank? && title.present?
      self.slug = title_to_slug
    end
  end

  def title_to_slug
    "#{title.to_s.downcase.parameterize.tr('_', '')}-#{rand(100_000).to_s(26)}"
  end
end
