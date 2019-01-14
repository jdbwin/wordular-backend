Rails.application.routes.draw do

  resources :home, only: [:index]
  resources :users, only: [:create]

  resource :auth, only: [] do
    post :login, to: 'auth#login'
  end

  namespace :user do

    resources :words, only: [:create]
    # use dash instead of underscore for readability
    resources :my_words, path: 'my-words', only: [:index]

  end



end
