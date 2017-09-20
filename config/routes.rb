Rails.application.routes.draw do
  root 'static_pages#home'

  get    '/mod_login',   to: 'sessions#new'
  post   '/mod_login',   to: 'sessions#create'
  delete '/mod_logout',  to: 'sessions#destroy'
end
