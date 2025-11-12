# app/controllers/meetings_controller.rb

class MeetingsController < ApplicationController
  
  def new
    # 1. どのペットの面会か？: URLの pet_id を使って、該当するペットを取得し @pet に格納
    # URLは /pets/:pet_id/meetings/new の形式なので、params[:pet_id] でIDを取得
    @pet = Pet.find(params[:pet_id]) 

    # 2. フォーム用の空の Meeting オブジェクトを作成し @meeting に格納
    # @pet.meetings.build とすることで、この面会リクエストが自動的に @pet と紐づいた状態になります。
    @meeting = @pet.meetings.build
  end

  def create
    # (この後の作業で記述します)
  end
end