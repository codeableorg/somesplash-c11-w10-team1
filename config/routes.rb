# Rails.application.routes.draw do
#   resources :categories
#   resources :photos
#   resources :comment
# end

Rails.application.routes.draw do
  resources :categories do
    resources :comments, only: [:create, :destroy]
  end
  resources :photos
end
