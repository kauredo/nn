Rails.application.routes.draw do
  root to: 'pages#work'
  get '/work', to: 'pages#work'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/caroline', to: 'pages#caroline'
  get '/randoms', to: 'pages#randoms'
  get '/fire', to: 'pages#fire'
  get '/peace', to: 'pages#peace'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
