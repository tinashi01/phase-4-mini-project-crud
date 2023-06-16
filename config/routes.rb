Rails.application.routes.draw do
  get 'spices', to: 'spices#index'
  post 'spices', to: 'spices#create'
  patch 'spices/:id', to: 'spices#updated'
  delete 'spices/:id', to: 'spices#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
