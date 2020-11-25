Rails.application.routes.draw do
  get 'authors/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors do
    resources :books
 end
end
