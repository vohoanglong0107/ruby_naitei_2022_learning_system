require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "login" do
    describe "succesfully" do
      before do
        user = create(:user, :valid)
        sign_in_as user
      end
      it{should redirect_to(root_path)}
    end
    describe "unsuccesfully" do
      before do
        user = build(:user, :valid)
        user.password = "wrong_password"
        sign_in_as user
      end
      it{should redirect_to(signin_path)}
    end
  end
end
