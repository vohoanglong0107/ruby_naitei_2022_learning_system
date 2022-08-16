# frozen_string_literal: true

class SignupComponent < ViewComponent::Base
  def initialize user:
    super
    @user = user
  end
end
