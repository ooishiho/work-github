Rails.application.routes.draw do
# 顧客用
devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

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

root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
