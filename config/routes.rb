Rails.application.routes.draw do
  get 'admin/users'
  get 'admin/make_admin'

  resources :book_reviews

  devise_for :users

  root to: 'home#index'

  get 'books/search', to: 'books#index'

  resources :books

  resources :ratings

  mount Attachinary::Engine => "/attachinary"
end
