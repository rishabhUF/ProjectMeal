Rails.application.routes.draw do
  devise_for :org_people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :catalogues

  root "catalogues#index" ## I have to change the root of the application. 
end 
