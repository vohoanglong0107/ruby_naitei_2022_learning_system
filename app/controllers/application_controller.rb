class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  include Pagy::Backend
  before_action :switch_locale, :authenticate_user!
  layout :layout_by_resource

  private

  def switch_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
