Rails.application.routes.draw do
  # root "articles#index"
  resources :categories
  resources :photos
  resources :comments
end
