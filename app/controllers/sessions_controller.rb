class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(password: [:session][:password])
      redirect_to login_path
    else
     flash.now[:danger] = "認証に失敗しました。"
     render :new
    end
  end
end
