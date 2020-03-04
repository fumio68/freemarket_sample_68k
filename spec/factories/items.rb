FactoryBot.define do
  factory :item do
    id                    {"1"}
    name                  {"りんご"}
    price                 {"100"}
    content               {"りんごです"}
    condition             {"新品"}
    shipping              {"出品者負担"}
    shipping_area         {"東京都"}
    days_to_ship          {"2日"}
    shipping_method       {"メルカリ便"}
    status                {"0"}
    user
    category
    category_id_1         {"1"}
    category_id_2         {"20"}
    category_id_3         {"120"}
  end
end