Rails.application.routes.draw do
  resources :jobs
  resources :people
  resources :stories
  resources :series do
    resources :comics
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
