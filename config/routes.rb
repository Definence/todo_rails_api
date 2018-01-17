Rails.application.routes.draw do

  resources :tasks

  resources :users do
    collection do
      post :sign_in
      post :sign_up
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# root 'tasks#index'
end
