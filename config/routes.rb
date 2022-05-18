Rails.application.routes.draw do

  root to: "homes#top"
  get '/home/about' => 'homes#about', as: "about"

  namespace :public do
    resources :books, only: [:new, :create, :index, :show, :update, :destroy] do
      resources :book_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :create, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
  	  get 'followers' => 'relationships#followers', as: 'followers'
  	  get '/users/out' => '/public/users#out'
  	  patch '/users/quit' => '/public/users#quit'
    end

    get '/search', to: 'searches#search'
  end

  namespace :admin do
    resources :books, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
