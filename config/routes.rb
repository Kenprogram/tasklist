Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get '/', to: 'tasks#index'
  post '/', to:'tasks#index'
  resources :users, only: [:new, :create]
  
  get '/', to: 'tasks#index'
  resources :tasks
end
