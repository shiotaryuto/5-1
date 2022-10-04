Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  get '' => 'homes#top' ,as: 'top'
  resources :items, only: [:new, :create, :index, :show, :edit, :update]
  resources :genres, only: [:create, :index, :edit, :update]
  resources :customers, only: [:show, :index, :edit, :update]
  resources :orders, only: [:show, :update]
end
root to: 'public/homes#top'
namespace :public do
  get '' => 'homes#top' ,as: 'top'
  get '/about' => 'homes#about' ,as: 'about'
  resources :items, only: [:show, :index]
  resources :customers, only: [:show, :edit, :update]
  get '/current_customer/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch '/current_customer/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete '/cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
   get '/orders/thanks' => 'orders#thanks', as: 'thanks'
  resources :orders, only: [:new, :create, :index, :show]
  post '/orders/confirm' => 'orders#confirm', as: 'confirm'

  resources :addresses, only: [:create, :index, :edit, :update, :destroy]

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
