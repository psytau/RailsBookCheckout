# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book_rating do
    rating 1
    book nil
    user nil
  end
end
