# frozen_string_literal: true

class Admin::ContentHeaderComponent < ViewComponent::Base
  def initialize title:, button:
    super
    @title = title
    @button = button
  end
end
