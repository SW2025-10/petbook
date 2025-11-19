# app/controllers/meetings_controller.rb

class MeetingsController < ApplicationController
  
  def new
    @pet = Pet.find(params[:pet_id]) 

    @meeting = @pet.meetings.build
  end

  def create
  end
end