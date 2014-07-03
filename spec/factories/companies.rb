# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "MyString"
    sym "MyString"
    website "MyString"
    om_email "MyString"
    user nil
  end
end
