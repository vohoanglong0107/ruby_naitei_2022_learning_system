module SessionsHelper
  def sign_in user
    session[:user_id] = user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user&.authenticated? cookies[:remember_token]
        sign_in user
        @current_user = user
      end
    end
  end

  def current_user? user
    user == current_user
  end

  def logged_in?
    return if current_user.present?

    flash[:error] = t ".request_login"
    redirect_to signin_path
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def log_out
    forget current_user
    session.delete :user_id
    @current_user = nil
  end
end
