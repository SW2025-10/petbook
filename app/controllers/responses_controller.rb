class ResponsesController < ApplicationController
  before_action :set_survey

  def new
    @response = @survey.responses.build
    @survey.questions.each do |q|
      @response.answers.build(question: q)
    end
  end

  def create
    @response = @survey.responses.build(response_params)
    if @response.save
      @response.evaluate_result!
      redirect_to survey_response_path(@survey, @response)
    else
      render :new
    end
  end

  def show
    @response = @survey.responses.find(params[:id])
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def response_params
    params.require(:response).permit(
      answers_attributes: [:question_id, :score]
    )
  end
end
