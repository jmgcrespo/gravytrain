Rails.application.routes.draw do
  resources :providers, only: [:new, :create, :show] do
    member do
      get 'confirm'
    end
  end

end
