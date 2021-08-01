Rails.application.routes.draw do
  devise_for :users
  get "home/about" => "homes#about" ,as: "about"
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites,only:[:create,:destroy,:index]
    resources :post_comments,only:[:create,:destroy]
  end
  resources :users,only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings" ,as: "followings"
    get "followers" => "relationships#followers" ,as: "followers"
  end
  get "/search" => "searchs#search"
end
