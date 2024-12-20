require 'sidekiq/web'

Rails.application.routes.draw do
  # Monta o painel do Sidekiq
  mount Sidekiq::Web => '/sidekiq'

  # Rotas para os produtos
  resources :products

  # Rotas para o carrinho
  resource :cart, only: [:show] do
    post :add_product, on: :collection 
    post 'add_item', to: 'carts#update_quantity' 
    delete ':product_id', to: 'carts#remove_product', as: :remove_product 
  end

  # Verificação de saúde da aplicação
  get "up" => "rails/health#show", as: :rails_health_check

  # Rota padrão
  root "rails/health#show"
end
