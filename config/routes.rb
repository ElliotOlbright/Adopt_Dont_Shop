Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/about', to: 'welcome#about'

  resources :pets

  get '/apps/new', to: 'apps#new'
  post '/apps', to: 'apps#create'
  get '/apps/:id', to: 'apps#show'
  patch '/apps/:id', to: 'apps#update'
  patch '/apps/:id', to: 'apps#submit'


  get '/admin/shelters', to: 'admin_shelters#index'
  get '/admin/shelters/:id', to: 'admin_shelters#show'
  
  # post '/admin/applications', to: 'apps#create'
  get '/admin/applications', to: 'admin_applications#index'
  patch '/admin/applications/:id', to: 'admin_applications#update'
  get '/admin/applications/:id', to: 'admin_applications#show'
 
end
