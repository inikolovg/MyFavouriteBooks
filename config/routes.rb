Rails.application.routes.draw do
  resources :books
  root :to => redirect('/books')
end