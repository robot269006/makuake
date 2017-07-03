# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    pjt_name "MyText"
    pjt_image "MyString"
    pjt_description "MyText"
    money_collected 1
    money_target 1
    deadline "2017-07-03"
    user_type 1
  end
end
