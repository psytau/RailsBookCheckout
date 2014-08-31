Rails.application.routes.draw do
  resources :book_reviews

  devise_for :users, :controllers => { registrations: 'registrations' }
 
  root to: 'home#index'

  resources :books

  resources :ratings

  resources :invite

  mount Attachinary::Engine => "/attachinary"
end
