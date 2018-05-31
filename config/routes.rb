Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]

  # now we can create our own show action since we used except up
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # added route in data management section - scope
  get 'portfolios/angular-items', to: 'portfolios#angular'

  # get 'pages/home'
  root to: 'pages#home'

  # get 'pages/about'
  get 'about-me', to: 'pages#about'

  # get 'pages/contact'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end

end
