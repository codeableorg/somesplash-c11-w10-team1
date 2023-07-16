# Rails.application.routes.draw do
#   resources :categories
#   resources :photos
#   resources :comment
# end

Rails.application.routes.draw do
  root "categories#index"
  resources :categories do
    resources :comments, only: [:create, :destroy]
  end
  resources :photos do
    resources :comments, only: [:create, :destroy]
  end
  resources :comments
  
  get '/search', to: 'search#search'
  get '/search/result', to: 'search#result'
end
