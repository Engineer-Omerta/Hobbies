Rails.application.routes.draw do

  namespace :user do
      get 'hobbies/main_hobby'
      get 'users/follows'
      get 'users/followers'
      get 'users/mypage'
      get 'users/unsubscribe'
      resources :categories, only: [:index, :show]
      resources :hobbies, only: [:index, :new, :create, :show]
      resources :users, only: [:show, :edit, :update]
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
