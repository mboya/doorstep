Rails.application.routes.draw do
  Healthcheck.routes(self)
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end

  jsonapi_resources :users, only: [:index]
  jsonapi_resources :products
  jsonapi_resources :suppliers, only: [:index]
  jsonapi_resources :routes, only: %i[index create update]
  jsonapi_resources :product_prices
  jsonapi_resources :product_routes, only: [:index]
  jsonapi_resources :customers, only: %i[index create show update]
  jsonapi_resources :warehouses, only: [:index]
  jsonapi_resources :stocks, only: %i[index create]
end
