Rails.application.routes.draw do
  get 'posts/new'

  root 'static_pages#home'

  get    '/mod_login',   to: 'sessions#new'
  post   '/mod_login',   to: 'sessions#create'
  delete '/mod_logout',  to: 'sessions#destroy'

  get 'control_panel', to: 'static_pages#control_panel'

  get '/:id(.:format)', to: 'boards#show', as: :board

  resources :boards, except: :show do
    resources :posts
  end
end
