# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trigger_event do
    subject "MyString"
    text "MyText"
  end
end
