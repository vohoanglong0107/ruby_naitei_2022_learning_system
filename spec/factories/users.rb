FactoryBot.define do
  factory :user do
    trait :valid do
      name{"Example User"}
      email{"example@railstutorial.org"}
      password{"foobar"}
    end
    trait :invalid_password do
      name{"Example User"}
      email{"example@railstutorial.org"}
      password{""}
    end
  end
end
