class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    @m = Micropost.find(params[:id])
    redirect_back(fallback_location: root_path)
  end
  def destroy
    redirect_back(fallback_location: root_path)
  end
end
