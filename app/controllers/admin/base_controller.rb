class Admin::BaseController < ApplicationController
  before_action :guard_login, :is_admin?
  layout "layouts/application_admin"

  private

  def is_admin?
    return if current_user.admin?

    flash[:error] = t ".error"
    redirect_to root_path
  end
end
