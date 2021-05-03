Rails.application.routes.draw do
  devise_for :users
  get "home/about" => "homes#about" ,as: "about"
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites,only:[:create,:destroy]
    resource :post_comments,only:[:create,:destroy]
  end
  resources :users,only: [:index,:show,:edit,:update]
end
