Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :venues, only: [:show]
  namespace :admin do
    resources :tasks,  only: [:new, :create, :edit, :update, :destroy]
    resources :organizers, :bookings, :employees
    resources :venues do
      resources :inventories do
        resources :items, only: [:new, :create, :edit, :update, :destroy]
      end
    end
  end
  get '/admin/organizers/:id/add_poc', to: 'admin/organizers#add_poc', as: 'add_poc'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/home', to: 'admin#home'
  root 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
