# Rails.application.routes.draw do
#   get "orders/new"
#   get "carts/show"
#   get "products/index"
#   get "products/show"
#   root "users/sessions#new"

#   namespace :admins do
#     get "tags/index"
#     get "tags/new"
#     get "tags/create"
#     get "tags/destroy"
#     get "books/index"
#     get "books/new"
#     get "books/create"
#     get "books/show"
#     get "books/edit"
#     get "books/update"
#     get "books/destroy"
#     get "sessions/new"
#     get  "sign_in",  to: "sessions#new"
#     post "sign_in",  to: "sessions#create"
#     delete "sign_out", to: "sessions#destroy"
#     resources :books
#     resources :tags, only: [:index, :new, :create, :destroy]
#   end

#   namespace :users do
#     get "mypages/show"
#     get "registrations/new"
#     get  "sign_in",  to: "sessions#new"
#     post "sign_in",  to: "sessions#create"
#     delete "sign_out", to: "sessions#destroy"
#     get  "sign_up",  to: "registrations#new"
#     post "sign_up",  to: "registrations#create"
#     resources :mypages, only: [:show]
#   end

#   resources :products, only: [:index, :show]
#   resource  :cart, only: [:show, :destroy] do
#     post :add_item
#     delete :remove_item
#   end
#   resources :orders, only: [:new, :create] do
#     post :confirm, on: :collection
#     get  :complete, on: :member
#   end
# end
Rails.application.routes.draw do
  get "orders/new"
  get "carts/show"
  get "products/index"
  get "products/show"
  root "users/sessions#new"

  namespace :admins do
    get  "sign_in",  to: "sessions#new"
    post "sign_in",  to: "sessions#create"
    delete "sign_out", to: "sessions#destroy", as: :sign_out

    resources :books
    resources :tags, only: [:index, :new, :create, :destroy]
  end

  namespace :users do
    get  "sign_in",  to: "sessions#new"
    post "sign_in",  to: "sessions#create"
    delete "sign_out", to: "sessions#destroy", as: :sign_out

    get  "sign_up",  to: "registrations#new"
    post "sign_up",  to: "registrations#create"

    resources :mypages, only: [:show]
  end

  resources :products, only: [:index, :show]

  resource :cart, only: [:show, :destroy] do
    post :add_item
    delete :remove_item
  end

  resources :orders, only: [:new, :create] do
    post :confirm, on: :collection
    get  :complete, on: :member
  end
end
