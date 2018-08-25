class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    # @m = current_user.microposts.build(set_micropost)
    @m = Micropost.new(set_micropost)
    @m.user_id = current_user.id
    if @m.save
      flash[:success] = "Posts!!!"
      # redirect_back(fallback_location: root_path)
      redirect_to root_url
    else
      @list = Micropost.all
      flash.now[:danger] = "noT Posts!!"
      render 'toppages/index'
    end
  end
  def destroy
    @m.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_micropost
    params.require(:micropost).permit(:content)
  end
  def correct_user
    @m = Micropost.find(params[:id])
    unless @m.user == current_user
      redirect_to root_url
    end
  end
end
