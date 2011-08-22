Convicts::Application.routes.draw do
  root :to => "home#index"

  match '/convicts/:id/*name' => "convicts#show"

  resources :convicts
  
  match ':controller(/:action(/:id(.:format)))'
end
