
FactoryGirl.define do
  factory :user do
    email 'user@lala.lala'
    password '12345678'

    # factory :user_with_books do
    #   after(:create) do |user, evaluator|
    #     FactoryGirl.create(:valid_book, user: user)
    #   end
    # end
  end

  factory :admin, class: User do
    after(:create) { |user| user.add_role 'admin'}
    email 'admin@lala.lala'
    password '12345678'
  end

  factory :book, aliases: [:valid_book] do
    author 'Judy Bloom'
    title 'Blubber'
  end

  factory :book_review do
    content "MyText"
    user nil
    book nil
  end

end



