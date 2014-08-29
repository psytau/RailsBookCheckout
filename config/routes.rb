Rails.application.routes.draw do
  get 'admin/users'
  get 'admin/make_admin'
  get 'admin/user_can_review'
  get 'admin/books'
  get 'admin/can_do'
  get 'admin/users_report'
  get 'admin/view_as_user/:view_as_user', to: 'admin#view_as_user'
  get 'admin/view_as_self', to: 'admin#view_as_self'

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
