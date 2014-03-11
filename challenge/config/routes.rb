Challenge::Application.routes.draw do

  resources :purchase_orders

  root 'purchase_orders#index'

end
