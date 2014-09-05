
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@lala.lala"}
    firstname 'Elenora'
    sequence(:lastname) {|n| 'Nigil #{n}'}
    password '12345678'

    after(:create) { |user| user.confirm!}
  end

  factory :admin, class: User do
    after(:create) { |user| user.confirm!; user.add_role 'admin'}
    email 'admin@lala.lala'
    password '12345678'
  end

  factory :book do
    author 'Theodore Roosevelt'
    sequence(:title) { |n| "The life and times of a president vol #{n}" }
    approved_at Time.now
    active true
  end

  factory :book_review do
    content "MyText"
    user nil
    book nil
  end

end



