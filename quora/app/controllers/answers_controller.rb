class AnswersController < ApplicationController
  def index
    @answers = Answer.where(user_id: current_user.id)
    ids = []
    @answers.each do |answer|
     ids << answer.question_id
    end
    @questions = Question.where(id: ids)
  end

  def show
    id = params[:answer_id] ? params[:answer_id] : params[:id]
    @answer = Answer.find(id)
    redirect_to :index
  end

  def edit
  end

  def update
    @answer = Answer.find(params[:id])
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to user_answers_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        flag[:error] = "Something went wrong. Please try again"
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text)
    end

end
