# frozen_string_literal: true

class Admin::SlideComponent < ViewComponent::Base
  include SessionsHelper
  def initialize words:
    super
    @words = words
  end
end
