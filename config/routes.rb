Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #Check the header for api_version key
  api_version(module: 'V1', header: { name: 'api_version', value: 'v1' }, default: true) do

    #nested resources
    resources :parkings, defaults: { format: 'json' }, only: [:create] do
      member do
        resource :pay, only: [:update], controller: 'parkings/pay'
        resource :out, only: [:update], controller: 'parkings/out'
      end
    end

    #we need to describe the show action in another block to use the id key as "plate"
    resources :parkings, defaults: { format: 'json' }, only: [:show], param: :plate
  end
end
