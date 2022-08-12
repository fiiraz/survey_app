Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :surveys, only: [:show, :create]
      resources :questions
      resources :options
    end
  end
end
