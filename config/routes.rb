Convicts::Application.routes.draw do
  root :to => "home#index"

  resources :convicts
  
  match ':controller(/:action(/:id(.:format)))'
end
