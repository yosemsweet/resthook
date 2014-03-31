Resthook::Engine.routes.draw do
  resources :hooks

  root to: 'dashboard#show'
end
