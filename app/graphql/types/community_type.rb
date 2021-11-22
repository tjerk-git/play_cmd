module Types
  class CommunityType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :slug, String, null: false
    field :small_title, String, null: false
    field :community_avatar, String, null: false
    field :summary, String, null: true
    field :owner, Types::UserType, null: false
    field :created_by, Types::UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
