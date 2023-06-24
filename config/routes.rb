Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  resources :items do
    resources :pays ,only:[:create] do

    end
  end
end
