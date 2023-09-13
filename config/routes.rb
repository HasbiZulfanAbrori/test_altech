Rails.application.routes.draw do

  resources :authors, only: [:index]
  get '/authors/new', to: 'authors#new', as: 'new_author'
  post '/authors', to: 'authors#create', as: 'create_author'
  get '/authors/:id', to: 'authors#show', as: 'author'
  get '/authors/:id/edit', to: 'authors#edit', as: 'edit_author'
  patch '/authors/:id', to: 'authors#update', as: 'update_author'
  delete '/authors/:id', to: 'authors#destroy', as: 'destroy_author'
  
  resources :books, only: [:index]
  get '/books/new', to: 'books#new', as:'new_book'
  post '/books', to: 'books#create', as: 'create_book'
  get '/books/:id', to: 'books#show', as: 'book'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  patch '/books/:id', to: 'authors#update', as: 'update_book'
  delete '/books/:id', to: 'authors#destroy', as: 'destroy_book'
  get 'index_json', to: 'books#index_json'
  
  resources :users
end
