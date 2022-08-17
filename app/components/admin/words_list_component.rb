# frozen_string_literal: true

class Admin::WordsListComponent < ViewComponent::Base
  def initialize words:
    super
    @words = words
  end
end
