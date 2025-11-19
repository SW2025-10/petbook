# app/controllers/meetings_controller.rb

class Admin::MeetingsController < ApplicationController
  
  def index
    @meetings = Meeting.all
  end
  
  def new
    @pet = Pet.find(params[:pet_id]) 

    @meeting = @pet.meetings.build
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @meeting = Meeting.new(
      customer_name: params[:meeting][:customer_name],
      email: params[:meeting][:email],
      meeting_datetime: params[:meeting][:meeting_datetime],
      pet_id: params[:pet_id]
    )
    if @meeting.save #saveできたらリダイレクト
    redirect_to admin_pets_path 
    else
    render :new, status: :unprocessable_entity 
    end
  end
end