Rails.application.routes.draw do
  root to: 'filters#index'
  resources :filters, only: [:index] do
    collection do
      get 'search'
    end
  end
end
