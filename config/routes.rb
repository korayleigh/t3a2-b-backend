# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    devise_scope :user do
      get '/users/show', to: 'users/registrations#show'
    end

    devise_for :users,
               defaults: { format: :json },
               controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations',
               }

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    get '/menu_grouped', to: 'menu_items#index_grouped'
    resources :menu_items, only: %i[index show create update destroy]
    resources :orders, only: %i[index show create update destroy]
    get '/tables', to: 'orders#tables'
    resources :order_items, only: %i[index show create update destroy]
    get '/statuses', to: 'order_items#statuses'
    resources :categories, only: %i[index show create update destroy]
  end
end
