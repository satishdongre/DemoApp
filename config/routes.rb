Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :posts
  get '/your_posts', to: 'posts#your_post'
  root "posts#index"
  get "profile", to: "users#profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
