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
<<<<<<< HEAD
=======
    get '/menu_grouped', to: 'menu_items#index_grouped'
>>>>>>> c2a262b (fixed post rebase/merge oddities)
    get '/menu/:id', to: 'menu_items#show'
    resources :orders, only: %i[index show create update destroy]
    post '/menu_items', to: 'menu_items#create', as: 'new_menu_item'
    put '/menu_items/:id', to: 'menu_items#update', as: 'edit_menu_item'
    delete '/menu_items/:id', to: 'menu_items#destroy', as: 'destroy_menu_item'
  end
end
