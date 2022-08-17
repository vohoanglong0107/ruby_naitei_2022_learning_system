# frozen_string_literal: true

class Admin::ContentHeaderComponent < ViewComponent::Base
  def initialize title:, button:, path:
    super
    @title = title
    @button = button
    @path = path
  end
end
