class WelcomeController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    # name = params[:name]
    # email = params[:email]
    # admin = params[:admin]
    user = User.new(user_params)
  end

  def edit
    
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
