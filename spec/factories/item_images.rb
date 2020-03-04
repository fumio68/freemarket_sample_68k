FactoryBot.define do
  factory :item_image do
    id           {"1"}
    image        {File.open("#{Rails.root}/app/assets/images/material/logo/logo.png")}
    item
  end
end