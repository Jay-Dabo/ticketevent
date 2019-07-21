Rails.application.routes.draw do

  devise_for :users, path: 'auth', path_names: { sign_in: 'login'}
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  root 'events#index'
  resources :tickets do
    resources :purchases
  end
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
