Rails.application.routes.draw do
  root "categories#index"
  resources :categories
  resources :photos
  resources :comments
  get "/search", to: "photos#search", as: 'search'
  get '/search_results', to: 'photos#search_results', as: 'search_results'
end
