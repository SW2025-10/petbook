
class PetsController < ApplicationController
  def index
    @pets = Pet.all 
    if params[:query1].present?
      @pet_label = Pet.where(label: params[:query1])
    end
  end
  
  def create
    
  end
  def urugawa
    
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
  def like
    pet_id =params[:id].to_s 
    liked_pets_string = cookies[:liked_pets]#クリエイトとかと違ってクッキーは扱い方が違うから、リスト作らなあかんらしい
    liked_pets_array = liked_pets_string.present? ? liked_pets_string.split(','):[]#これはとってきたのをリストで扱いやすくする方法
    if liked_pets_array.include?(pet_id)
      liked_pets_array.delete(pet_id)
      @liked = false
    else
      liked_pets_array << pet_id
      @liked = true
    end
    cookies[:liked_pets] = {
      value: liked_pets_array.join(','),
      expires: 30.days.from_now,
    }
  end
    
end