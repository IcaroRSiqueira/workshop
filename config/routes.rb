Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :challenges, only: %i[index show] do
    resources :solutions, only: %i[new create show index]
    resources :challenge_comments, only: %i[new create]
  end
  resources :solutions, only: [] do
    resources :solution_comments, only: %i[new create]
  end
end
