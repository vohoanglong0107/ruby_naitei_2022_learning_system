require "rails_helper"

RSpec.describe "signup routing", type: :routing do
  it{should route(:get, "/signup").to(controller: "users", action: "new")}
end
