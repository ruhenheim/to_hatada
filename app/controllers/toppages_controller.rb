class ToppagesController < ApplicationController
  def index
    # @micropost = current_user.microposts.build
    @list = Micropost.all
  end
end
