Rails.application.routes.draw do
  resources :controllers
  post 'cipher', to: 'cipher#rotate', defaults: { format: 'json' }
end
