Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :profiles do
    resource :preferences, only: [:edit, :update]
    resources :birth_info, only: [:edit, :update]
  end

end
