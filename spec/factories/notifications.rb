# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    title "MyText"
    content "MyText"
    product nil
    instruction nil
  end
end
