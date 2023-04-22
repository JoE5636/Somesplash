Rails.application.routes.draw do
  resources :categories
  resources :photos, except: %i[index]
end
