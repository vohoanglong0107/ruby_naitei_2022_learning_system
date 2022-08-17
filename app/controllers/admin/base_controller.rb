class Admin::BaseController < ApplicationController
  before_action :guard_login, :guard_admin
  layout "application_admin"

  private

  def guard_admin
    return if current_user.admin?

    flash[:error] = t "permission_denied"
    redirect_to root_path
  end
end
