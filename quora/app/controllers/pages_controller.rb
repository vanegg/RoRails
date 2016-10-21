class PagesController < ApplicationController
  def show   
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  def login
  end

  def new
    @user = User.new
  end

  def create
    
  end

  def val_login
    @user = User.authenticate(params[:user][:name], params[:user][:password])

    if @user
      session[:id] = @user.id
      redirect_to user_path(id: @user.id)
    else
      flash[:error] = "Usuario no registrado"
      redirect_back fallback_location: pages_login_path
    end
  end

  def logout
    session.clear
    redirect_to pages_home_path
  end

  private
    def valid_page?
      File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
    end
end
