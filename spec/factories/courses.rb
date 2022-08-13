FactoryBot.define do
  factory :course do
    trait :n5 do
      name{"N5"}
      description{"For student starting with Japanese"}
      order{1}
    end
  end
end
