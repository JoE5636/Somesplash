Rails.application.routes.draw do
  resources :categories
  resources :photos, except: %i[index]

  # get '/comments/create', to 'comments#create'
  get "/photos/search", to: "photos#search", as: "photos_search"
  get "comments/index"
  get "comments/new"
  get "comments/show"
  get "comments/create"
  get "comments/edit"
  get "comments/update"
  get "comments/destroy"
end
