Rails.application.routes.draw do
  root 'pets#index'
  
  get 'admin/pets/search', to: 'admin/pets#search'
  
  get 'pets/search', to: 'pets#search'
  
  get 'pets/urugawa', to: 'pets#urugawa'
  


  resources :pets,  only: [:index, :show,:create] do
    member do#pets/id/にするためのmember、全体の中から一とるイメージ
      post 'like'
    end
    resources :meetings, only: [:new, :create]
  end


  resources :inquiries, only: [:new, :create]
  
  namespace :admin do #これをつかうことで新しくモデル作らずとも管理画面でＰＥＴのモデルを使えるで
   resources :pets do
     member do
       post 'hukusei'
     end
    end
   resources :meetings
  end

end