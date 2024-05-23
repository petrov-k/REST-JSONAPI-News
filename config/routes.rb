Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  use_doorkeeper
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      jsonapi_resources :articles do
        jsonapi_resources :comments
      end
      jsonapi_resources :users
      jsonapi_resources :categories

      namespace :rest do
        resources :articles do
          resources :comments
        end
      end
    end
  end
end
