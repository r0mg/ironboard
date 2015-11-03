Rails.application.routes.draw do
  resources :events, except: :destroy
  resources :users, except: :destroy

  get '/' => 'application#root', as: 'root'
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get "/logout" => 'sessions#destroy'

end
