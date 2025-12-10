Rails.application.routes.draw do
  devise_for :users
  root 'pets#index'
  
  get 'admin/pets/search', to: 'admin/pets#search'
  
  get 'pets/search', to: 'pets#search'
  
  get 'pets/urugawa', to: 'pets#urugawa'
  
  get 'pets/iineitiran', to: 'pets#iineitiran'
  


  resources :pets,  only: [:index, :show,:create] do
    member do#pets/id/にするためのmember、全体の中から一とるイメージ
      post 'like'
    end
    resources :meetings, only: [:new, :create]
  end


  resources :inquiries, only: [:new, :create]
  
  namespace :admin do #これをつかうことで新しくモデル作らずとも管理画面でＰＥＴのモデルを使えるで
   
   
   
   resources :pets do
     collection do
      get 'view_all'
     end
     member do
       post 'hukusei'
       get 'daily_views'
     end
    end
   resources :meetings
  end

end