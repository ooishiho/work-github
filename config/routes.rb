Rails.application.routes.draw do
# 顧客用
  devise_for :customers,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"

  namespace :public do
    # resources :customers, only:[:show,:edit,:update]
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'

   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only:[:index,:update,:destroy,:create]

    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
      resources :orders, only:[:new,:show,:index,:create]


    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
    resources :items, only:[:show,:index]
  end

get '/home/about' => 'public/homes#about', as: 'about'
# 管理者用


get '/admin' => 'admin/homes#top'
 namespace :admin do
    resources :order_details, only:[:update]

    resources :orders, only:[:show,:update]

    resources :customers, only:[:index,:show,:edit,:update]

    resources :genres, only:[:index,:create,:edit,:update]

    resources :items, only:[:new,:index,:create,:show,:edit,:update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
