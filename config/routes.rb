Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :expenditures, except: [:show, :update]
  resources :users, defaults: { format: :json }, except: [:destroy, :index]
end
