
require "sidekiq/web"
Rails.application.routes.draw do
  # get 'login/new'
mount Sidekiq::Web.new => '/sidekiq'
  # get 'login/create'
  # get 'signups/index'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :signups
  resources :logins
  # Defines the root path route ("/")
  # root "articles#index"
  delete'logout' => "signups#destroy"
  #mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
 

end
