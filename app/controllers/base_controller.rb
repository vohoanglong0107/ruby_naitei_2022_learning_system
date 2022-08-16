class BaseController < ApplicationController
  before_action :logged_in?, :is_admin?

  private

  def is_admin?
    return unless current_user.admin?

    flash[:error] = t ".error"
    redirect_to admin_root_path
  end
end
