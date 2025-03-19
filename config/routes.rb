Rails.application.routes.draw do
  get 'users/show'
  root 'homes#top' 
  post 'posts' => 'posts#create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'top', to: 'homes#top', as: 'top_homes'
  
    resources :posts, only: [:index, :show, :edit, :create, :update, :destroy] do
  end
    resources :users, only: [:new, :create, :show, :edit, :update, :index, :destroy] do
      get 'my_page', on: :collection, to: 'users#show', as: 'my_page'
  end 
end