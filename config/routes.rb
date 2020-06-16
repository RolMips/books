# config/routes.rb
Rails.application.routes.draw do
  root 'pages#home'
  get 'p1' => 'pages#page1'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
  delete 'users/login' => 'users#logout'
  get 'users' => 'users#list'
  resources :books, only: [:index, :create, :show, :update]
  resources :users, only: [:show, :create, :update, :destroy]
  #Equivalent à la version détaillée
  #get 'books' => 'books#index'
  #post 'books' => 'books#create'
  #get 'books/:id' => 'books#show'
  #patch 'books/:id' => 'books#update'
  #delete 'books/:id' => 'books#destroy'
end
