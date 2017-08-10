Rails.application.routes.draw do

  resources :cocktails, except: [ :edit, :update ] do
    resources :doses, only: [ :create ]
  end

  root 'cocktails#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
