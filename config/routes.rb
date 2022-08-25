# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/signin", to: "sessions#new"
    post "/signin", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :users, only: %i(new create)
    resources :courses, only: %i(index show)
    resources :lessons, only: :show
    resources :exams, except: :destroy
    resources :user_learn_words, only: %i(create destroy)
    resources :lessons do
      resources :words, only: :index
    end
    namespace :admin do
      root to: "static_pages#index"
      resources :static_pages
      resources :courses
      resources :lessons do
        resources :words, only: :index
      end
      resources :words
      resources :users, only: %i(index destroy)
      resources :exams, only: %i(index show)
    end
  end
end
