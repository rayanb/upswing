Rails.application.routes.draw do
  get '/', to: "users#index"

  resources :users

  namespace :api do
    resources :users, defaults: { format: :json }
  end
end
