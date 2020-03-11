Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
}
resources :games
get '/not_found', to:'pages#not_found', as: 'not_found'
get '*all', to: 'pages#not_found', constraints: lambda { |req|
  req.path.exclude? 'rails/active_storage'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
