Rails.application.routes.draw do
  root "articles#index"                     #this defines the default landing page

  #get "/articles", to: "articles#index"     #"/articles" is the name of the controller, "articles#index #index is a method defined on the articles controller"
  #get "/articles/:id", to: "articles#show"  #"/articles/:id" :id is a route parameter, this captures a segment of the request's path and puts that in the params hash. Accessible by params[:id] in the show action of ArticlesController
  resources :articles do
    resources :comments
  end
end
