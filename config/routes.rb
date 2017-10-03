Rails.application.routes.draw do
  get 'posts/new'

  root 'static_pages#home'

  get    '/mod_login',   to: 'sessions#new'
  post   '/mod_login',   to: 'sessions#create'
  delete '/mod_logout',  to: 'sessions#destroy'

  get 'control_panel', to: 'static_pages#control_panel'

  get '/:id(.:format)', to: 'boards#show', as: :board

  resources :boards, except: [:show, :new, :create] do
    resources :posts, except: :show
  end

  post '/control_panel/new_board', to: 'boards#create', as: :new_board

  post '/control_panel/remove_posts', to: 'moderation#remove_posts', as: :remove_posts
  post '/control_panel/new_user', to: 'moderation#new_user', as: :new_user

  get '/:board_id/thread/:id(.:format)', to: 'posts#show', as: :post

  post '/:board_id/thread/:id(.:format)', to: 'posts#create', as: :reply
end
