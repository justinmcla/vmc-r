Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :venues, only: [:show], param: :slug
  namespace :admin do
    get '/', to: 'admin#index'
    resources :bookings, :employees
    resources :tasks,  only: [:new, :create, :edit, :update, :destroy]
    resources :organizers do
      resources :point_of_contacts, only: [:destroy]
      resources :contacts, only: [:destroy]
    end
    resources :venues, param: :slug do
      resources :inventories do
        resources :items, only: [:new, :create, :edit, :update, :destroy]
      end
    end
  end
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  root 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
