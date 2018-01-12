Rails.application.routes.draw do
  get 'sessions/new'

  # get 'users/index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/update'

  resources :tasks
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# root 'tasks#index'
end
