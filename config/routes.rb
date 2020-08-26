Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :profiles do
    resource :preferences, only: [:edit, :update]
    resource :birth_infos, only: [:edit, :update]
    resource :photos, only: [:edit, :update]
    resource :relationship_types, only: [:edit, :update]
  end

  resources :user, only: [:show]

end
