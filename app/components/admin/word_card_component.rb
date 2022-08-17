# frozen_string_literal: true

class Admin::WordCardComponent < ViewComponent::Base
  def initialize word:
    super
    @definition = word.definition
    @translation = word.translation
  end
end
