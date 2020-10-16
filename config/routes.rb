Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :venues, only: [:index, :show, :update], param: :slug
  namespace :admin do
    get '/', to: 'admin#index'
    get '/settings', to: 'admin#show'
    resources :users, param: :slug, only: [:edit, :update, :destroy]
    resources :bookings, :employees
    resources :tasks,  only: [:new, :create, :edit, :update, :destroy]
    resources :organizers do
      resources :point_of_contacts, only: [:destroy]
      resources :contacts, only: [:destroy]
    end
    resources :inventories, only: [:index]
    resources :venues, param: :slug do
      resources :inventories do
        resources :items, only: [:new, :create, :edit, :update, :destroy]
      end
    end
    resources :attachments, only: [:destroy]
  end
  match '/404', to: 'errors/not_found#show', via: :all
  match '/500', to: 'errors/internal_server_error#show', via: :all
  get '/auth/:provider/callback', to: 'omniauth#create'
  root 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
