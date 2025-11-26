Rails.application.routes.draw do
  root 'pets#index'
  
  get 'admin/pets/search', to: 'admin/pets#search'
  
  get 'pets/search', to: 'pets#search'
  
  get 'pets/urugawa', to: 'pets#urugawa'
  
  #inquiryを追加
  #get 'pets/inquiry', to: 'pets#inquiry'
  get 'inquiries/inquiry', to: 'inquiries#inquiry'
  


  resources :pets,  only: [:index, :show,:create] do
    member do#pets/id/にするためのmember、全体の中から一とるイメージ
      post 'like'
    end
    resources :meetings, only: [:new, :create]
    resources :comments, only: :create
  end


  resources :inquiries, only: [:new, :create]
  
  namespace :admin do #これをつかうことで新しくモデル作らずとも管理画面でＰＥＴのモデルを使えるで
   resources :pets
   #adminのinquireを追加
   resources :inquiries, only: [:index, :show, :destroy]
  end

end