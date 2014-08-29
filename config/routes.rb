Rails.application.routes.draw do
  resources :book_reviews

  devise_for :users

  root to: 'home#index'

  get 'books/search', to: 'books#index'

  match 'books/deactivate/:id', to: 'books#toggle_activation', via: :get

  resources :books

  resources :ratings

  resources :followers

  mount Attachinary::Engine => "/attachinary"
end
