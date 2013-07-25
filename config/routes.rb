SmallCounting::Application.routes.draw do
  resources :flows

  devise_for :users
  
  resources :users do
    member do
      get :edit_profile
      patch :update_profile
    end
  end
  
  root to: 'flows#index'
end
