Rails.application.routes.draw do
# 顧客用
devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

root to: "homes#top"

  namespace :customers do
    resources :customers, only:[:show,:edit,:update,:unsubscribe,:withdraw]
  end
  namespace :customers do
    resources :cart_items, only:[:index,:update,:destroy,:destroy_all,:create]
  end
  namespace :customers do
    resources :orders, only:[:new,:show,:index]
  end
   namespace :customers do
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
  end
   namespace :customers do
    resources :items, only:[:show,:index]
  end

get '/home/about' => 'homes#about', as:'about'
# 管理者用
devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

get '/admin' => 'homes#top'
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
