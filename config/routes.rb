Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products
      resources :companies
      resources :stores
    end
  end
  # Check User Exist?
  get :check_user, to: 'signin#check_user'

  post 'refresh',   controller: :refresh, action: :create
  post 'signin',    controller: :signin,  action: :create
  post 'signup',    controller: :signup,  action: :create
  delete 'signin',  controller: :signin,  action: :destroy
end
