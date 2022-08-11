FactoryBot.define do
  factory :user do
    trait :valid do
      name{"Example User"}
      email{"example@railstutorial.org"}
    end
  end
end
