NRC::Application.routes.draw do
  resource :session
  resources :users
  root to: 'static_pages#home'
end
