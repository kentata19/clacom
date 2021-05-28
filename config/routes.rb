Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users,
    controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#home'
  #userに関するルーティング
  get '/users/:id', to: 'users#show', as: 'user'
  resources :users, only: [:edit]
  #postに関するルーティング

  get '/posts/bulk' => 'posts#bulk', as: 'bulk_post'
  resources :posts, only: [:new, :create, :show, :index, :edit, :update]
  #composerに関するルーティング
  post '/composers' => 'composers#create'
  resources :composers, only: [:new, :show, :index, :edit, :update]
  #レビューに関するルーティング
  get '/reviews/new/:id' => 'reviews#new', as: 'new_review'
  resources :reviews, only: [:new, :create, :show, :index, :edit, :update]
end
