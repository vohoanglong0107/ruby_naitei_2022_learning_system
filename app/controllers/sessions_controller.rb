class SessionsController < ApplicationController
  layout "signin", only: %i(new create)

  def new
    redirect_user
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      handle_signin user
    else
      flash[:error] = t ".signin_fail"
      redirect_to signin_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to signin_path
  end

  def handle_signin user
    sign_in user
    flash[:success] = t ".signin_success", user_name: user.name
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_user
  end

  def find_user
    user = User.find_by email: params[:session][:email].downcase
    return if user

    flash[:error] = t ".email_not_found"
    redirect_to signin_path
  end

  private
  def redirect_user
    return unless logged_in?

    current_user.admin? ? redirect_to(admin_root_path) : redirect_to(root_path)
  end
end
