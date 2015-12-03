Rails.application.routes.draw do
  root to: 'curiosities#index'

  resources :curiosities do
    resources :comments
  end

  resources :tags

  resources :inquirers

  resources :inquirer_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'inquirer_sessions#new'
  get 'logout' => 'inquirer_sessions#destroy'

end
