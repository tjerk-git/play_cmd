class Tag < ApplicationRecord
<<<<<<< HEAD

=======
    has_many :post_tags
    has_many :posts, :through => :post_tags

    has_many :user_tags
    has_many :users, :through => :user_tags

    before_validation :create_slug

    def create_slug
        if slug.blank? && name.present?
          self.slug = name_to_slug
        end
      end
    
      def name_to_slug
        "#{name.to_s.downcase.parameterize.tr('_', '')}-#{rand(100_000).to_s(26)}"
      end
>>>>>>> cedf11736d3a7c62427ebed59233146011d989c8
end
