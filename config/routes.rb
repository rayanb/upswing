Rails.application.routes.draw do
  get '/', to: "users#index"

  resources :users, except: [:create, :update, :destroy]


  namespace :api do
    resources :users, defaults: { format: :json }
  end

  get 'auth/:provider/callback', to: 'api/users#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'api/users#destroy', as: 'signout'

end
