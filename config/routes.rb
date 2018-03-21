Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'users#index'

  mount Friends::API => '/'

  get '/404' => 'errors#error_404'
  get '/422' => 'errors#error_422'
  get '/500' => 'errors#error_500'
end
