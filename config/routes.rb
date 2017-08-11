Rails.application.routes.draw do

  resources :cocktails, only: [ :index, :create, :show, :destroy ] do
    resources :doses, only: [ :create ]
  end

  root 'cocktails#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
