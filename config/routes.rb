Rails.application.routes.draw do

  # トップページ（仮にペット一覧ページにしておく）
  root 'pets#index'

  # ペット関連のページ
  # /pets (一覧) と /pets/1 (詳細) が使えるようになる
  resources :pets, only: [:index, :show] do
    # 「ペット詳細ページ」の中で「面会予約」ができるようにする
    # /pets/1/meetings/new (予約フォーム)
    # /pets/1/meetings (予約実行)
    resources :meetings, only: [:new, :create]
  end

  # お問い合わせフォーム
  # /inquiries/new (フォーム)
  # /inquiries (フォーム送信)
  resources :inquiries, only: [:new, :create]
  
end