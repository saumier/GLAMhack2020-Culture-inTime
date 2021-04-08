Rails.application.routes.draw do
  root 'home#index'
  get '/search', to: 'search#index'

  get '/spotlight', to: 'home#spotlight'

  get '/admin', to: 'admin#index', as: 'admin'

  get '/admin/build_cache', to: 'admin#build_cache', as: 'admin_build_cache'
 

  resources :productions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
