module SessionsHelper
  def current_user
    unless @current_user
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user
    end
  end
  def logged_in?
    # !!current_user
    if current_user.nil?
      false
    else
      true
    end
  end
end
