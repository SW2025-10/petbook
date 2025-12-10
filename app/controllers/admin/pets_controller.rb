
class Admin::PetsController < ApplicationController
  
  def index
    @pets = Pet.all 
    if params[:query1].present?
      @pet_label = Pet.where(label: params[:query1])
    end
  end
  
  def new #インスタンスを新しく作る。railsの仕様でformをつくる時に必要らすしい
   @pet = Pet.new
  end
  def create #セキュリティ的にはあんまりこの書き方よくないらしくてparamsをつかった方がいいみたい
    @pet = Pet.new(
      name: params[:pet][:name],
      price: params[:pet][:price],
      comment: params[:pet][:comment],
      label: params[:pet][:label],
      birthday: params[:pet][:birthday],
    )
    if @pet.save #saveできたらリダイレクト
    redirect_to admin_pets_path 
    else
    render :new, status: :unprocessable_entity 
    end
  end
  
  def edit
    @pet = Pet.find(params[:id]) 
  end
  
  def update
    pet = Pet.find(params[:id])
    pet.update(
      name: params[:pet][:name],
      price: params[:pet][:price],
      comment: params[:pet][:comment],
      label: params[:pet][:label],
      birthday: params[:pet][:birthday],
    )
    redirect_to '/admin/pets'
  end


  def show
    @pet = Pet.find(params[:id]) 
  end
  #ここはあんまりスマートじゃないあとでなおす
  #現状はラベル検索で放置している
  def search
    @pet_search = Pet.where(label: params[:query])
    @pets = Pet.all
    @pet_label = []
    render :index
  end
  def destroy
   pet = Pet.find(params[:id])
   pet.destroy
   redirect_to '/admin/pets'
  end
  def hukusei
    pet = Pet.find(params[:id])
    @pet = Pet.new
    @new_pet=Pet.new(
      id: pet,
      name: pet.name,
      price: pet.price,
      comment: pet.comment,
      label: pet.label,
      birthday: pet.birthday,
    )
    @new_pet.save
    redirect_to '/admin/pets'
    
  end
  def daily_views
    @pet = Pet.find(params[:id])
    @daily_view_counts = @pet.view_logs
                              .group(:viewed_on)
                              .count
  end
  
  def view_all
   # 1. 日付順にグループ化・カウントしてハッシュを取得
   daily_counts_hash = ViewLog.group(:viewed_on).order(:viewed_on).count

  # 2. ハッシュから、グラフの軸に使うための2つの配列（ラベルとデータ）に分割する
  #    keys: 日付（ラベル）の配列
  #    values: カウント数（データ）の配列
  
   # @chart_labels : ["2025-12-08", "2025-12-09", ...]
   @chart_labels = daily_counts_hash.keys
  
   # @chart_data : [12, 5, 18, ...]
   @chart_data = daily_counts_hash.values 
  end
end

