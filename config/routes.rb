Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products
      resources :companies
      resources :stores
    end
  end
end
