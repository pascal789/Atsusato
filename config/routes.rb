Rails.application.routes.draw do
  
  root to: "homes#top"
  get '/home/about' => 'homes#about', as: "about"

  namespace :public do
    resources :books, only: [:new, :create, :index, :show, :update, :destroy]
    resources :users, only: [:index, :show, :edit]
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
