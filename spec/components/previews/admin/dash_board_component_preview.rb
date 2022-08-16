class Admin::DashBoardComponentPreview < ViewComponent::Preview
  layout "layouts/application_admin"
  def with_default
    render(Admin::DashBoardComponent.new)
  end
end
