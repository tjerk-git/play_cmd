module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :communities, [Types::CommunityType], null: true, description: "Get communities"
    def communities
        Community.all()
    end

    field :current_user, Types::UserType, null: false, description: "Get current user"
    def current_user()
        context[:current_user]
    end
  end
end
