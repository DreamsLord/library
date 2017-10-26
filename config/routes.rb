Rails.application.routes.draw do
  root 'books#index'
  resources :books, :rents
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
