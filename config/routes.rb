Rails.application.routes.draw do

  devise_scope :user do #deviseのログイン画面をrootにする記述
    root :to => "devise/sessions#new"
  end

  namespace :user do
      get 'hobbies/search' => 'hobbies#search', as:'hobby_search'
      get 'home/top'
      get 'home/hobby'
      get 'home/location'
      get 'hobbies/main_hobby'
      get 'users/mypage'
      get 'users/unsubscribe'
      resources :home, only: [:index]
      resources :users, only: [:show, :edit, :update] do
        resource :relationships, only: [:create, :destroy]
        get :matches, on: :member
        get :follows, on: :member
        get :followers, on: :member
        #on memberと書く事で/users/followingsというURLになる　 get 'users/follows'と同じ意味
      end
      resources :hobbies, only: [:index, :new, :create, :show] do
        resources :user_hobbies, only: [:create, :destroy]
      end
      resources :categories, only: [:index, :show]
      resources :matches, only: [:index]
      resources :rooms, only: [:show, :create]
  end

  namespace :admin do
      resources :categories, only: [:index, :show, :new, :create, :edit, :update]
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
