Rails.application.routes.draw do
  resources :categories do
    resources :comments, only: [:create]
  end
  resources :photos, except: %i[index] do
   resources :comments, only: [:create]
  end 
  
  resources :comments, except: %i[index]

  get '/photos/search', to: 'photos#search', as: 'photos_search'
end
