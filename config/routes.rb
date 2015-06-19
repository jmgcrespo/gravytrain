Rails.application.routes.draw do
  resources :providers, only: [:new, :create, :show] do
    resources :events, shallow: true
    member do
      get 'confirm'
    end
  end

end
