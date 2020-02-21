FactoryBot.define do
  factory :user do
    id                    {"1"}
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"阿部"}
    last_name             {"香すけ"}
    j_family_name         {"あべ"}
    j_last_name           {"こうすけ"}
    b_year                {"2020"}
    b_month               {"2"}
    b_date                {"13"}
  end
end