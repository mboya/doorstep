Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end

  jsonapi_resources :users, only: [:index]
  jsonapi_resources :products
  jsonapi_resources :suppliers, only: [:index]
end
