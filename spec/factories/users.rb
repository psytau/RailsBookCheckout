FactoryGirl.define do
  factory :user do
    email 'user@lala.lala'
    password '12345678'
  end

  factory :admin, class: User do
    after(:create) { |user| user.add_role 'admin'}
    email 'admin@lala.lala'
    password '12345678'
  end

  factory :valid_book, class: Book do
    author 'Judy Bloom'
    title 'Blubber'
  end
end
