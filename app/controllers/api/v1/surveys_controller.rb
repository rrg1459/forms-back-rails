class Api::V1::SurveysController < ApplicationController
  def index
    @surveys = Survey.includes(questions: :options).all
    render json: @surveys.to_json(include: { questions: { include: :options } })
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      render json: @survey, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, questions_attributes: [:content, :question_type, options_attributes: [:content]])
  end
end
