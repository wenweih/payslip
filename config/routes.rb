Rails.application.routes.draw do

  resources :dashboard
  resources :employee do
    member do
      put 'change_namespace'
    end
  end
  resources :namespace
  get 'query_user', to: 'namespace#query_user'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create, :destroy,  :new]

  resources :users, controller: "users", only: [:create, :destroy] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  get "/sign_up" => "users#new", as: "sign_up"

  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboard#index"
  end
  constraints Clearance::Constraints::SignedOut.new do
    root to: "sessions#new"
  end

end
