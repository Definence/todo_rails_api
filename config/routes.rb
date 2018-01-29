Rails.application.routes.draw do

  resources :tasks do
    # кастомний контролер
    collection do
      post :batch_destroy
    end
  end

  resource :sessions, only: :create

  resources :users, only: [:create, :email_confirmation] do
    collection do
      post :email_confirmation
    end
  end

end
