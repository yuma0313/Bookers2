Rails.application.routes.draw do
  devise_for :users
  get "home/about" => "homes#about" ,as: "about"
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users,only: [:index,:show,:edit,:update]
end
