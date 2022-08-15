class Admin::SideBarComponentPreview < ViewComponent::Preview
  layout "application_admin"
  def with_default
    render(Admin::SideBarComponent.new)
  end
end
