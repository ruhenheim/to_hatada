class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def new
    @user = User.new
  end
  def create
    @user = User.new(set_user)
    if @user.save
      flash[:success] = "ユーザ登録成功だぜ."
      redirect_to root_url
    else
      flash[:danger] = "おいおい.失敗だぜ."
      render :new
    end
  end
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end

  private
  def set_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
