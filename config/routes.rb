Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users
  resources :quotes do
    resources :line_item_dates, except: %i[index show]
  end
  root 'pages#home'
end
