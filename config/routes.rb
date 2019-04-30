Rails.application.routes.draw do
  # get 'user/index' => "user/index"
  get 'user/new' => "user#new"
  post 'user/create' => "user#create"
  get 'user/:id' => "user#mypage"
  get 'login/form' => "user#form"
  post 'user/logout' => "user#logout"
  post 'user/login' => "user#login"
  

  get 'article/new' => "article#new"
  get 'article/index' => "article#index"
  get 'article/:id' => "article#show"
  post 'article/create' => "article#create"
  post 'article/:id/update' => "article#update"
  get 'article/:id/edit' => "article#edit"
  post 'article/:id/destroy' => "article#destroy"

  

  get 'home/top' => "home#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#top"
end
