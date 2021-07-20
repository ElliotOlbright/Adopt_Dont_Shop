Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/about', to: 'welcome#about'

  resources :pets
  resources :apps

  get '/admin/shelters', to: 'admin_shelters#index'
  get '/admin/shelters/:id', to: 'admin_shelters#show'
  
  post '/admin/applications', to: 'apps#create'
  patch '/admin/applications/:id', to: 'apps#update'
  get '/admin/applications', to: 'admin_applications#index'
  get '/admin/applications/:id', to: 'admin_applications#show'
 
end
