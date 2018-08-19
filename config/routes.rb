Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end
  mount BlogApi::Base => '/'
  root 'welcome#index'
end
