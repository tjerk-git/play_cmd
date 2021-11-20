module Types
  class UserType < Types::BaseObject
    field :email, String,null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :avatar_url, String, null: true
  end
end