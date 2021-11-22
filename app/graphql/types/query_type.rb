module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :communities, [Types::CommunityType], null: true, description: "Get communities"
    def communities
        Community.all()
    end
  end
end
