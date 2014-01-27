NRC::Application.routes.draw do
  resource :session
  resources :users
  resources :pages, defaults: {format: :json}
  resources :layouts
  resources :contents
  root to: 'static_pages#home'
end
