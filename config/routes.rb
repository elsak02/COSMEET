Rails.application.routes.draw do
   require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    root to: 'users#index', as: :authenticated_root
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :profiles do
    resource :preferences, only: [:edit, :update]
    resource :birth_infos, only: [:edit, :update]
    resource :photos, only: [:edit, :update]
    resource :relationship_types, only: [:edit, :update]
    resource :element_rankings, only: [:edit, :update]
    resource :mode_rankings, only: [:edit, :update]
    resource :personality_traits, only: [:edit, :update]
  end

  resources :users, only: [:index, :show]
  resources :likes, only: [:new, :create]
  resources :matches, only: [:index, :show]
  # get 'chatroom', to: 'matches#chatroom'

  resource :my_profile, only: [:show, :edit, :update, :chart]
  get 'chart', to: 'my_profiles#chart'

  resources :matches do
    member do
      get :chatroom
    end
    resources :messages, only: :create
  end
end
