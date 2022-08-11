require "rails_helper"

RSpec.describe "users/new.html.erb", type: :view do
  describe "get /new" do
    it "returns http success" do
      assign(:user, build(:user, :valid))
      render
      expect(rendered).to match(I18n.t("users.new.signup"))
      expect(rendered).to match(I18n.t("users.form.name_label"))
      expect(rendered).to match(I18n.t("users.form.email_label"))
      expect(rendered).to match(I18n.t("users.form.password_label"))
      expect(rendered).to match(I18n.t("users.form.password_confirmation_label"))
    end
  end
end
