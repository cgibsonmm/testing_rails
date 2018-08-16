Rails.application.routes.draw do
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "links#index"

  resources :links, only: [:index, :new, :create] do
    member do
      post :upvote
    end
  end
end
