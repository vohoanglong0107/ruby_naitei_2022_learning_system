# frozen_string_literal: true

class FormComponent < ViewComponent::Base
  def initialize user:, button_type:
    super
    @user = user
    @button_type = button_type
  end
end
