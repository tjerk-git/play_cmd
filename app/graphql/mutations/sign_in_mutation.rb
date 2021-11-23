module Mutations
  class SignInMutation < BaseMutation
    field :user, Types::UserType, null: false
    field :token, String, null: false

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
        user = User.find_by_email(email)
        if user.valid_password? password
            {
                user: user,
                token: JsonWebToken.encode(sub: user.id)
            }
        else
            {
                user: nil,
                token: nil
            }
        end
    end
  end
end
