# frozen_string_literal: true

class Admin::SlideComponent < ViewComponent::Base
  include Devise::Controllers::Helpers
  def initialize words:
    super
    @words = words
  end
end
