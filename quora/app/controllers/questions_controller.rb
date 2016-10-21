class QuestionsController < ApplicationController
  
  def index
    @questions = Question.where(user_id: current_user.id)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    current_user.questions << @question
    if @question.save
      flash[:success] = "Question successfully saved"
    else
      flash[:error] = "Question not saved in database"
    end
    render :new
  end

  def all
    @questions= Question.all
    render :index
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text)
    end
  
end
