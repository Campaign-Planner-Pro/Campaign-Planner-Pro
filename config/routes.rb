Rails.application.routes.draw do
  root to: "campaigns#index" 
  resources :campaigns do
    resources :nonplayer_characters, only: %i[new create edit update destroy], expect: [:show]
    resources :player_characters, only: %i[new create edit update destroy], expect: [:show]
    resources :regions, only: %i[new create edit update destroy], expect: [:show]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
