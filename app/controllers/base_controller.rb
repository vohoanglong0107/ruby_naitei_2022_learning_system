class BaseController < ApplicationController
  before_action :guard_login, :guard_admin

  private

  def guard_admin
    return unless current_user.admin?

    flash[:error] = t ".error"
    redirect_to admin_root_path
  end
end
