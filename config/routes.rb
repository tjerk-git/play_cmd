Rails.application.routes.draw do
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
    if Rails.env.development?
        mount GraphqlPlayground::Rails::Engine, at: "/graphql_playground", graphql_path: "/graphql"
    end
    post "/graphql", to: "graphql#execute"

    devise_for :users, controllers: { registrations: 'registrations' }
    root to: "home#index"
end
