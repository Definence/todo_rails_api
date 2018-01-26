Rails.application.routes.draw do

  resources :tasks do
    # кастомний контролер
    collection do
      post :batch_destroy
    end
  end

  resources :users, only: :create

  resource :sessions, only: :create


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# root 'tasks#index'
end
