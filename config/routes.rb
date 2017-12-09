Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :nodes
    resources :accounts
  end
end
