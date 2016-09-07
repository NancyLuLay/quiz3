FactoryGirl.define do
  factory :comment do
    sequence(:body) {|n| Faker::ChuckNorris.fact + n.to_s}
  end
end
