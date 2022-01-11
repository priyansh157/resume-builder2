Rails.application.routes.draw do
  root   'home#index'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    '/signup'  => 'users#signup'
  post    '/signed'  => 'users#signed'
  
  get '/copy' => 'profiles#copy'
  get '/Experience/new' => 'experiences#new'
  resources :profiles , only: [:update]
  resources :educations , only: [:new]
  resources :experiences , only: [:new]
  resources :project , only: [:new]
   
#  get 'myscript' => 'myscript.js'
end
