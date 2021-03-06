Rails.application.routes.draw do
  root :to => 'users#new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions

  resources :users
  resources :trips do
    resources :pictures
  end

end
