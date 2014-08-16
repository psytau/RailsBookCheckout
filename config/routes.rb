Rails.application.routes.draw do
  resources :book_ratings

  resources :book_reviews

  devise_for :users

  root to: 'home#index'

  resources :books

  mount Attachinary::Engine => "/attachinary"
end
