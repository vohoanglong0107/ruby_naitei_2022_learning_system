class Admin::NavBarComponentPreview < ViewComponent::Preview
  layout "application_admin"
  def with_default
    render(Admin::NavBarComponent.new)
  end
end
