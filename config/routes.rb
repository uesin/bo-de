Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    collection do
      get 'search'
      get 'top'
      get 'infomation'
    end
    resources :comments, only: :create
  end
  resources :users


end
