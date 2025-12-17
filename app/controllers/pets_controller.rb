
class PetsController < ApplicationController
  def index
    @pets = Pet.all 
    if params[:query1].present?
      @pet_label = Pet.where(label: params[:query1])
    end
    
    liked_ids = liked_pet_ids
    @pets = @pets.sort_by { |p| liked_ids.include?(p.id) ? 0 : 1 }
    
    @survey = Survey.first # ここで対象のアンケートを取得
  end
  
  def create
    
  end
  def urugawa
    
  end
  def iineitiran
    liked_pets_string = cookies[:liked_pets]
    liked_ids = liked_pets_string.to_s.split(',').compact_blank
    @liked_pets = Pet.where(id: liked_ids)
  end

  def show
    @pet = Pet.find(params[:id]) 
    @pet.increment!(:views_count)
    log = @pet.view_logs.find_or_initialize_by(viewed_on: Date.current)
    ViewLog.create(pet: @pet, viewed_on: Date.current)
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
  
  def inquiry
    @inquiry = Inquiry.new
  end
  
  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def liked_pet_ids
    cookies[:liked_pets].to_s.split(',').map(&:to_i)
  end
    
end