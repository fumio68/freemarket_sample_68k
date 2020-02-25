FactoryBot.define do
  factory :item do
    id                    {"1"}
    name                  {"りんご"}
    price                 {"100"}
    content               {"りんごです"}
    condition             {"新品"}
    shipping              {"0"}
    shipping_area         {"東京都"}
    days_to_ship          {"2日"}
    shipping_method       {"メルカリ便"}
    status                {"0"}
    user           
  end
end