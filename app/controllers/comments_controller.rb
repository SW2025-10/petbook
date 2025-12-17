class CommentsController < ApplicationController
    before_action :set_pet

  def create
    @comment = @pet.comments.new(comment_params)

    if @comment.save
      redirect_to @pet, notice: "コメントを投稿しました"
    else
      redirect_to @pet, alert: "コメントの投稿に失敗しました"
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
