Rails.application.routes.draw do
  shallow do
    resources :bills do
      resources :votes, only: [:index, :create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
