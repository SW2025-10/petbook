# app/controllers/pets_controller.rb

class PetsController < ApplicationController
  
  # indexアクション（前回修正済み）
  def index
    @pets = Pet.all 
  end

  # showアクション（ペット詳細ページ）
  def show
    # 【この行を追記または修正】
    # URLに含まれるID（params[:id]）を使って、データベースから特定のペットを検索し、@petに格納する
    @pet = Pet.find(params[:id]) 
  end
  
end