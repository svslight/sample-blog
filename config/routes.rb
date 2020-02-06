Rails.application.routes.draw do
  get '/' => 'home#index'

  # Описываем те методы, 
  # которые будут использоваться на странице контактов
  resource :contacts, only: [:new, :create]
  
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
