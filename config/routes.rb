Rails.application.routes.draw do

  resources :users, except: [:new, :edit] do
    resources :posts, except: [:new, :edit]
  end

end