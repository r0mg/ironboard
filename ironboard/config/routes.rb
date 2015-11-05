Rails.application.routes.draw do
  resources :events, except: :destroy
  resources :users, except: :destroy
  resources :tags, only: [:index, :show]

  get '/' => 'application#root', as: 'root'
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get "/logout" => 'sessions#destroy'
  post '/events/:id' => 'rsvps#create', as: 'rsvp'
  get '/users/:id/attended_events' => 'users#attended_events', as: 'guest_past_events'
  post '/events/:id/rate' => 'ratings#create'
  get '/users/:id/hosted_events' => 'users#hosted_events', as: 'host_past_events'

end
