Rails.application.routes.draw do
  devise_for :users, controllers: {
            sessions: "users/sessions",
          }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :salaries, only: [:index, :create, :update, :destroy]

  get "salaries/search", to: "salaries#search"
  get "salaries/compare", to: "salaries#compare"

  resources :users, only: [:update]
end
