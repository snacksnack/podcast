Rails.application.routes.draw do
  
  devise_for :podcasts
  resources :podcasts, only: [:index, :show]
  root 'welcome#index'

end
