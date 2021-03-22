Rails.application.routes.draw do
  root to: 'pages#work'
  get '/work', to: 'pages#work'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
