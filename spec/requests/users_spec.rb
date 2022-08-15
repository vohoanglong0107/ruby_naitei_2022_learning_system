require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "POST /users" do
    describe "succesfully" do
      before do
        post "/users", params: {user: {name: "Example User",
                                       email: "exampleuser@railstutorial.org",
                                       password: "foobar",
                                       password_confirmation: "foobar"}}
      end

      it{should redirect_to(root_path)}
    end
    describe "unsuccesfully" do
      before do
        post "/users", params: {user: {name: "Example User",
                                       email: "",
                                       password: "",
                                       password_confirmation: ""}}
      end
      it{should redirect_to(signup_path)}
    end
  end
end
