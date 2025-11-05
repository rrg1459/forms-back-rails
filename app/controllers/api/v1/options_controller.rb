class Api::V1::OptionsController < ApplicationController
  def index
    @options = Option.all
    render json: @options
  end

  def show
    @option = Option.find(params[:id])
    render json: @option
  end

  def create
    @option = Option.new(option_params)
    if @option.save
      render json: @option, status: :created
    else
      render json: @option.errors, status: :unprocessable_entity
    end
  end

  private

  def option_params
    params.require(:option).permit(:content, :question_id)
  end
end
