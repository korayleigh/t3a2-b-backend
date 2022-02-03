# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/api' do
    get '/menu', to: 'menu_items#index'
    get '/menu_grouped', to: 'menu_items#index_grouped'
    post '/menu_items', to: 'menu_items#create', as: 'new_menu_item'
    put '/menu_items/:id', to: 'menu_items#update', as: 'edit_menu_item'
    get '/order/:id', to: 'orders#show'
    get '/orders', to: 'orders#index'
  end
end
