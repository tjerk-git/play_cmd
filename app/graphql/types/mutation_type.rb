module Types
  class MutationType < Types::BaseObject
    field :sign_in_mutation, mutation: Mutations::SignInMutation
    
  end
end
