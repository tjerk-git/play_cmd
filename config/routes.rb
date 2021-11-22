Rails.application.routes.draw do
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
    post "/graphql", to: "graphql#execute"

    devise_for :users, controllers: { registrations: 'registrations' }
    root to: "home#index"
end
