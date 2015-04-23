Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  resources :users, except: [:update, :destroy]


  namespace :api do
    resources :users, defaults: { format: :json }
    resources :friendships, defaults: { format: :json }, only: [:create, :destroy, :update]
    get '/industries', to: 'industries#index'
    post '/friendships', to: 'friendships#create'
    post '/friendrequests', to: 'friendrequests#create'
  end

  get 'auth/:provider/callback', to: 'api/users#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'api/users#logout', as: 'signout'

end
