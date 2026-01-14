# app/controllers/api/pets_controller.rb
class Api::PetsController < ApplicationController
  # セキュリティチェック（CSRF）を一旦スキップするか、JS側でトークンを送る設定が必要です
  
  def recommend
      # 1. 送られてきた履歴から、一番多いカテゴリを特定
      categories = params[:categories] || []
      favorite = categories.max_by { |cat| categories.count(cat) }
    
      # 2. そのカテゴリに絞り、かつ「作成日時の新しい順」に3つ取得
      if favorite.present?
        # order(created_at: :desc) で新着順（降順）になる
        @pets = Pet.where(label: favorite).order(created_at: :desc).limit(3)
      else
        # 履歴が全くない（初回訪問など）場合のフォールバック
        @pets = Pet.order(created_at: :desc).limit(3)
      end
    
      # 3. JSON形式でフロント（JS）に返す
      render json: @pets.as_json(only: [:id, :name, :price, :label])
     
    end
end