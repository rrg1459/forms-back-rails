class Api::V1::QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:options).all
    render json: @questions.to_json(include: :options)
  end

  def show
    @question = Question.find(params[:id])
    render json: @question.to_json(include: :options)
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :question_type, :survey_id, options_attributes: [:content])
  end
end
