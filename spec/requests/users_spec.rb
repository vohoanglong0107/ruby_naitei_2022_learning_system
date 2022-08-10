require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST /users" do
    describe "succesfully" do
      before do
        post "/users", params: {user: {name: "Example User",
                                       email: "exampleuser@railstutorial.org",
                                       password: "foobar",
                                       password_confirmation: "foobar"}}
      end

      it{should redirect_to(signup_url)}
    end
    describe "unsuccesfully" do
      before do
        post "/users", params: {user: {name: "Example User",
                                       email: "",
                                       password: "",
                                       password_confirmation: ""}}
      end
      it{should render_template(:new)}
    end
  end
end
