Rails.application.routes.draw do
 
  get '/concerts' => 'concerts#index'
  get '/concerts/new' => 'concerts#new'
  post '/concerts' => 'concerts#create'
  get '/concerts/:id' 'concerts#show'
  get '/concerts/:id/edit' => 'concerts#edit'
  patch '/concerts/:id' => 'concerts#update'
  delete '/concerts/:id' => 'concerts#destroy' 
end
