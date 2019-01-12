Rails.application.routes.draw do

  resources :users, only: [:create]

  resource :auth, only: [] do
    post :login, to: 'auth#login'
  end

  namespace :user do

    # use dash instead of underscore for readability
    resources :my_words, path: 'my-words', only: [:index]

  end



end
