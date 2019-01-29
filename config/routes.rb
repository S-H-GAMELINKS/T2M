Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 't2_m#index'

  resources :t2_m do
    collection {post :import}
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
