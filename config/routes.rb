Rails.application.routes.draw do
  root "categories#index"
  resources :categories
  resources :photos
  resources :comments
  get "/search", to: "photos#search"
end
