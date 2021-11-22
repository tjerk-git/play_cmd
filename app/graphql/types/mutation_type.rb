module Types
  class MutationType < Types::BaseObject
    field :user, mutation: Mutations::User::CreateUser
  end
end
