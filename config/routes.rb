Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/about', to: 'welcome#about'

  resources :pets

  get '/admin/shelters', to: 'admin_shelters#index'
  get '/admin/shelters/:id', to: 'admin_shelters#show'

  get '/admin/applications', to: 'admin_applications#index'
  get '/admin/applications/:id', to: 'admin_applications#show'
end
