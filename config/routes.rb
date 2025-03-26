Rails.application.routes.draw do
  root 'homes#top' 
  post 'posts' => 'posts#create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'top', to: 'homes#top', as: 'top_homes'

  resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    member do
      delete 'delete_image' # 画像削除のためのルートを追加
    end
  end

  # usersのルートを一度だけ定義し、unsubscribeとwithdrawを追加
  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      get 'unsubscribe'  # 退会確認ページ
      patch 'withdraw'   # 退会処理
    end

    # my_page のためのカスタムルート
    get 'my_page', on: :collection, to: 'users#show', as: 'my_page'
  end
end
