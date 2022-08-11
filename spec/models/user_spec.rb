require "rails_helper"

RSpec.describe User, type: :model do
  subject{build(:user, :valid)}
  describe "name's validations" do
    it{should validate_presence_of(:name)}
    it do
      should validate_length_of(:name).is_at_most(Settings.user.name_max_length)
    end
  end
  describe "email's validations" do
    it{should validate_presence_of(:email)}
    it{should validate_uniqueness_of(:email).case_insensitive}
    it do
      should validate_length_of(:email)
        .is_at_most(Settings.user.email_max_length)
    end
    it do
      should allow_value("user@example.com",
                         "USER@foo.COM",
                         "A_US-ER@foo.bar.org",
                         "first.last@foo.jp",
                         "alice+bob@baz.cn")
        .for(:email)
    end
    it do
      should_not allow_value("user@example,com",
                             "user_at_foo.org",
                             "user.name@example.",
                             "foo@bar_baz.com",
                             "foo@bar+baz.com",
                             "foo@bar..com")
        .for(:email)
    end
  end
  describe "password's validations" do
    it do
      should validate_length_of(:password)
        .is_at_least(Settings.user.password_min_length)
    end
    it{should validate_confirmation_of(:password)}
    it{should have_secure_password(:password)}
  end
end
