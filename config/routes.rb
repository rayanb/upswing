Rails.application.routes.draw do
  get '/', to: "users#index"

  resources :users


  namespace :api do
    resources :users, defaults: { format: :json }, except: [:create, :update, :destroy]
  end

  get 'auth/:provider/callback', to: 'users#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'users#destroy', as: 'signout'

end
