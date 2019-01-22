Rails.application.routes.draw do
  resources :books
  get '/books/:id/similar_books' => 'books#search_similar_books', as: :search_similar_books
  root :to => redirect('/books')
end 