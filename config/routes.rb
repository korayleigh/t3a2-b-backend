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
  end

end
