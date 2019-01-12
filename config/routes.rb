Rails.application.routes.draw do
  resources :users, only: [:create, :login]

  resource :auth, only: [] do
    post :login, to: 'auth#login'
  end

end
