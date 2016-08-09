class SurveysController < ApplicationController
  def index
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(p)
  end


  private 

  def white_list
    params.require(:survey).permit(:name, :description)
  end
end
