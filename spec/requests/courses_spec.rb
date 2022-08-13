require "rails_helper"

RSpec.describe "Courses", type: :request do
  describe "GET index" do
    describe "succesfully" do
      before do
        user = create(:user, :valid)
        sign_in_as user
        get courses_path
      end
      it{should render_template(:index)}
    end
    describe "force login" do
      before do
        get courses_path
      end
      it{should redirect_to(signin_path)}
    end
  end
end
