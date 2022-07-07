Rails.application.routes.draw do
  devise_for :users, :controllers => {registration: 'registrations' }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "posts#index"

  resources :posts, only: [:new, :create, :index]
end
