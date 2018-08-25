class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "ログインしたぜ."
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:danger] = "ログインダメだぜ."
      render :new
    end
  end

  def destroy
  end
end
