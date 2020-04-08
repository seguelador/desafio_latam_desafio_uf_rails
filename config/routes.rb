Rails.application.routes.draw do
  resources :units, path: :uf do
    collection do
      get '/:date', to: "units#date"
    end
  end
  resources :requests, path: :client do
    collection do
      get '/:user', to: 'requests#request_by_user'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
