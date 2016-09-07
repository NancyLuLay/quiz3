Rails.application.routes.draw do

  resources :comments

  root "ideas#index"

  resources :ideas do
    resources :comments, only:[:index, :create, :destroy]
    resources :likes, only:[:create, :destroy]
    resources :joins, only:[:create, :destroy]
  end

  resources :users, only:[:new, :create]

  resources :sessions, only:[:new, :create] do
    delete :destroy, on: :collection
  end

end
