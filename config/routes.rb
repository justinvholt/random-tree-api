Rails.application.routes.draw do
  resources :table, path: '', only: [:show] do 
    resources :parent, only: [:show]
    resources :child, only: [:show]
  end
end
