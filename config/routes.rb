Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/signup", to: "users#new"
    get "/signin", to: "sessions#new"
    post "/signin", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :users, only: %i(new create destroy)
    namespace :admin do
      root to: "static_pages#index"
      resources :static_pages
    end
  end
end
