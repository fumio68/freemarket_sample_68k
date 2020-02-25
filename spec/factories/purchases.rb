FactoryBot.define do
  factory :purchase do
    id             {"1"}
    postcode       {"111-1111"}
    prefecture     {"埼玉県"}
    city           {"さいたま市"}
    block          {"1-1"}
    user
    item
  end
end