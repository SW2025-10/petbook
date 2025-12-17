class InquiriesController < ApplicationController
  #def new
    #@pet = Pet.new
  #end

  #def create
  #end
#end
  def inquiry
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to root_path, notice: "お問い合わせを送信しました！"
    else
      render :inquiry
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :content)
  end
end