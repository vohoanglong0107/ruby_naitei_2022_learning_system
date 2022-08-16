class UsersController < ApplicationController
  layout "signup", only: :new

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      flash.now[:danger] = t ".failure"
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end
end
