Rails.application.routes.draw do
  devise_for :users
  resources :statuses
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "jobs#index"
  get 'jobs_all/:order', to: 'jobs#index'

  get 'jobs_filtered/:filter', to: 'jobs#index', as: :jobs_filtered

  get 'jobs_react', to: 'jobs#index_react', as: :jobs_react



  devise_scope :user do
    get "/sign_out", to: "devise/sessions#destroy"
    get "/logout", to: "devise/sessions#destroy"
    get "/login", to: "devise/sessions#new"
    post "/login", to: "devise/sessions#create"
  end

  namespace :api do
    namespace :v1 do
      resources :jobs, only: [:index, :create, :destroy, :update]
    end
  end

end
