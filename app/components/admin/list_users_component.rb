# frozen_string_literal: true

class Admin::ListUsersComponent < ViewComponent::Base
  def initialize users:
    super
    @users = users
  end
end
