Rails.application.routes.draw do

  devise_scope :user do #deviseのログイン画面をrootにする記述
    root :to => 'user/home#top'
  end

  namespace :user do
      get 'home/top'
      get 'hobbies/search' => 'hobbies#search', as:'hobby_search'
      get 'home/hobby'
      get 'home/location'
      get 'hobbies/main_hobby'
      get 'users/mypage'
      get 'users/:id/unsubscribe' => 'users#unsubscribe', as:'user_unsubscribe'
      get 'users/:id/delete' => 'users#delete', as: 'delete'
      resources :home, only: [:index]
      resources :users, only: [:show, :edit, :update] do
        resource :relationships, only: [:create, :destroy]
        get :matches, on: :member
        get :follows, on: :member
        get :followers, on: :member
        #on memberと書く事で/users/followingsというURLになる　 get 'users/follows'と同じ意味
      end
      resources :hobbies, only: [:index, :new, :create, :show] do
        resource :user_hobbies, only: [:create, :destroy]
      end
      resources :categories, only: [:index, :show]
      resources :messages, :only => [:create]
      resources :rooms, :only => [:create, :show, :index]
  end

  namespace :admin do
      get 'home/top'
      get 'hobbies/search' => 'hobbies#search', as:'hobby_search'
      get 'users/:id/delete' => 'users#delete', as: 'delete'
      resources :users, only: [:index, :show, :edit, :destroy]
      resources :hobbies, only: [:show, :edit, :update, :destroy]
      resources :categories
  end

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
