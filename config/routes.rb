Rails.application.routes.draw do

  devise_for :users
  resources :statuses
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "jobs#index"
  get 'jobs_all/:order', to: 'jobs#index'

  get 'jobs_filtered/:filter', to: 'jobs#index', as: :jobs_filtered



  devise_scope :user do
    get "/sign_out", to: "devise/sessions#destroy"
    get "/logout", to: "devise/sessions#destroy"
    get "/login", to: "devise/sessions#new"
    post "/login", to: "devise/sessions#create"
  end

end
