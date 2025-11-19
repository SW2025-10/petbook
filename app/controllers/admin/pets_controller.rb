

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
    # 成功したら、新しいペットの詳細ページへリダイレクト
    redirect_to '/admin/pets'
    
  end
end

