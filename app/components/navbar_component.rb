# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def initialize user:
    super
    @user = user
  end

  def is_admin?
    @user.admin?
  end
end
