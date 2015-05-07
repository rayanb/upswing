Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  resources :users, except: [:update, :destroy] do
    get '/friends', to: 'friendships#index'
  end


  namespace :api do
    resources :users, defaults: { format: :json } do
      get '/friends', to: 'friendships#index'
      get '/location', to: 'users#locate'
    end
    resources :friendships, defaults: { format: :json }, only: [:create, :destroy, :update]
    get '/industries', to: 'industries#index'
    post '/friendships', to: 'friendships#create'
    post '/friendrequests', to: 'friendrequests#create'
    get '/current_user', to: 'users#current'
  end

  get 'auth/:provider/callback', to: 'api/users#create'
  get 'auth/failure', to: redirect('/')
  get '/auth/signout', to: 'api/users#logout'

end
