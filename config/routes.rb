Rails.application.routes.draw do
  get 'admin/users'
  get 'admin/make_admin'
  get 'admin/user_can_review'
  get 'admin/books'
  get 'admin/can_do'

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
