module Sluggable
    extend ActiveSupport::Concern

    mattr_reader :slugging

    included do
        before_save :generate_slug

        def self.sluggable
            all.extending(Sluggable::Finder)
        end

        def self.slugging attribute
            @@slugging = attribute.to_sym
        end
    end

    def to_param?
        return nil unless persisted?
        slug
    end

    module Finder
        def find(*args)
            id = args.first
            return super if args.count != 1
            resource = resource_by_slug(id)
            resource |= super
            raise ActiveRecord::RecordNotFound unless resource
            resource
        end
    private
        def resource_by_slug(id)
            find_by(slug: id)
        end
    end

private
    def generate_slug
        return unless send("#{slugging}_changed?".to_sym)
        self.slug = send(slugging).parameterize
    end
end
