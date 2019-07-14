Rails.application.routes.draw do  
  get 'comment/detail'
  post 'comment/:id/create' => "comment#create"    


  devise_for :members, :controllers => {
    :registrations => 'members/registrations',
    :sessions => 'members/sessions'   
  }

  devise_scope :member do
    get "sign_in", :to => "members/sessions#new"
    get "sign_out", :to => "members/sessions#destroy" 
    get "sign_out", :to => "members/registrations#destroy" 
    get "mypage", :to => "members/registrations#mypage"
    get "mypage/edit", :to => "members/registrations#edit"
  
  if Rails.env.development? #開発環境の場合
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  end
  # get 'user/index' => "user/index"
  get 'user/new' => "user#new"
  post 'user/create' => "user#create"
  get 'user/:id' => "user#mypage"
  get 'login/form' => "user#form"
  post 'user/logout' => "user#logout"
  post 'user/login' => "user#login"
  
  get 'article/new' => "article#new"
  get 'article/apply' => "article#apply"
  get 'article/index' => "article#index"
  get 'article/genre/:genre' => "article#genre"
  get 'article/:id' => "article#show"
  post 'article/create' => "article#create"
  post 'article/:id/update' => "article#update"
  get 'article/:id/edit' => "article#edit"
  post 'article/:id/destroy' => "article#destroy"

  

  get 'home/top' => "home#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#top"
end


#以下、deviseで設定したログイン機能に関わるルート
#Prefix Verb   URI Pattern                      Controller#Action
#        new_member_session GET    /members/sign_in(.:format)       devise/sessions#new
#            member_session POST   /members/sign_in(.:format)       devise/sessions#create
#    destroy_member_session DELETE /members/sign_out(.:format)      devise/sessions#destroy
#       new_member_password GET    /members/password/new(.:format)  devise/passwords#new
#      edit_member_password GET    /members/password/edit(.:format) devise/passwords#edit
#           member_password PATCH  /members/password(.:format)      devise/passwords#update
#                           PUT    /members/password(.:format)      devise/passwords#update
#                           POST   /members/password(.:format)      devise/passwords#create
#cancel_member_registration GET    /members/cancel(.:format)        devise/registrations#cancel
#   new_member_registration GET    /members/sign_up(.:format)       devise/registrations#new
#  edit_member_registration GET    /members/edit(.:format)          devise/registrations#edit
#       member_registration PATCH  /members(.:format)               devise/registrations#update
#                           PUT    /members(.:format)               devise/registrations#update
#                           DELETE /members(.:format)               devise/registrations#destroy
#                           POST   /members(.:format)               devise/registrations#create