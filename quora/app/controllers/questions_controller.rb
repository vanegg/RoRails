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

  def show
    id = params[:question_id] ? params[:question_id] : params[:id]
    @question = Question.find(id)
  end

  def edit
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to user_question_path(@question), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text)
    end
  
end
