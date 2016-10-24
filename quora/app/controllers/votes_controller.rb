class VotesController < ApplicationController
  def show
    
  end

  def new

    @vote = Vote.create
    if params[:type] == "Question"
      @elem = Question.find(params[:id])
    elsif params[:type] == "Answer"
      @elem = Answer.find(params[:id])
    end
    if @elem
      @elem.votes << @vote
      current_user.votes << @vote
    end

     unless @vote.save
        flash[:error] = "Vote not saved in database"
     end 
  end

end
