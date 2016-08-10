class QuestionsController < ApplicationController
  def edit
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    @answers = @question.answers
    if @question.update(whitelist)
      flash[:success] = "Your answers were successfully saved."
      redirect_to edit_survey_path(params[:survey_id])
    else
      flash.now[:errors] = "There were some errors saving your answers. #{@answers.errors.full_messages.join('')}"
      render :edit
    end
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(whitelist)
    if @question.save
      set_question_attributes
      flash[:success] = "Your question was successfully saved."
      redirect_to edit_survey_path(survey.id) unless params[:num_answers]
    else
      flash.now[:errors] = "Your survey was not updated, unfortunately."
      render :new
    end

  end


  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build
  end



  private 

  def set_question_attributes
    @question.num_answers = params[:num_options].to_i
    @question.multiple_answers = true if params[:num_answers] == "multiple"
    if params[:num_answers]
      @question.type = "multiple"
      @question.num_answers.times { @question.answers.create }
      redirect_to edit_survey_question_path(@survey.id, @question.id) 
    elsif params[:min_range] && params[:max_range]
      @question.type = "#{params[:min_range].to_i}..#{params[:max_range].to_i}"
    end
  end

  def whitelist
    params.require(:question).permit(:text, :num_answers, :multiple_answers, :answers_attributes => [:id, :text])
  end

end
  