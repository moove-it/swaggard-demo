Rails.application.routes.draw do

  mount Swaggard::Engine, at: '/swagger'

  resources :users, except: [:new, :edit] do
    resources :posts, except: [:new, :edit]
  end

end