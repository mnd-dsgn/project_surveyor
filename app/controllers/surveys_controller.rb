class SurveysController < ApplicationController
  def index
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(whitelist)
    if @survey.save
      flash[:success] = "Your survey was created."
      redirect_to @survey
    else
      flash.now[:errors] = "Your survey didn't create."
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    @survey.questions.build
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(whitelist)
      flash[:success] = "Your survey and questions have been updated."
      redirect_to @survey
    else
      flash.now[:errors] = "Your changes were not saved for some reason."
      render :edit
    end    
  end


  private 

  def whitelist
    params.require(:survey).permit(:name, :description, :questions_attributes => [:id, :text, :_destroy])
  end
end
