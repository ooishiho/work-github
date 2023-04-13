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
    resources :customers, only:[:show,:edit,:update]
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  put '/customers/withdraw' => 'public/customers#withdraw'
  end
  namespace :public do
    resources :cart_items, only:[:index,:update,:destroy,:create]
 delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  namespace :public do
    resources :orders, only:[:new,:show,:index,:create]
  get '/orders/confirm' => 'public/order#confirm'
  get '/orders/complete' => 'public/orders#complete'
  end
   namespace :public do
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
  end
   namespace :public do
    resources :items, only:[:show,:index]
  end

get '/home/about' => 'public/homes#about', as: 'about'
# 管理者用


get '/admin' => 'admin/homes#top'
 namespace :admin do
    resources :order_details, only:[:update]
  end
  namespace :admin do
    resources :orders, only:[:show,:update]
  end
  namespace :admin do
    resources :customers, only:[:index,:show,:edit,:update]
  end
  namespace :admin do
    resources :genres, only:[:index,:create,:edit,:update]
  end
  namespace :admin do
    resources :items, only:[:new,:index,:create,:show,:edit,:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
