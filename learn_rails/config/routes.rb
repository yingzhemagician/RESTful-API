Rails.application.routes.draw do
  resources :gasstations
  resources :users

  namespace :api do
    namespace :v1 do
      resources :gasstations do
        collection do
          get 'cheapest', to: 'gasstations#get_cheapest'
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  # root 'application#hello'
end
