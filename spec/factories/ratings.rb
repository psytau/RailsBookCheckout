# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    book nil
    user nil
    score 1
  end
end
