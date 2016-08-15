Rails.application.routes.draw do
  
  devise_for :podcasts
  resources :podcasts, only: [:index, :show] do
    resources: :episodes
  end
  root 'welcome#index'

end
