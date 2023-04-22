Rails.application.routes.draw do
  resources :categories
  resources :photos, except: %i[index]

  get '/photos/search', to: 'photos#search', as: 'photos_search'
end
