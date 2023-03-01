Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#home"

  resources :mentors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:index, :new, :create, :edit, :show, :destroy] do
    resources :bookmarks, only: [:create]
  end
  # Defines the root path route ("/")
  # root "articles#index"

  resources :mentors do
    resources :bookings, only: [:new, :create, :edit, :show, :destroy]
  end
end
